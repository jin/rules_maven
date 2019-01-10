# rules_maven

| Travis CI                                                                                                         |
| -----                                                                                                             |
| [![Build Status](https://travis-ci.org/jin/rules_maven.svg?branch=master)](https://travis-ci.org/jin/rules_maven) |

Transitive Maven artifact repository rule implementation that just depends on
the `coursier` CLI tool.

This is a experimental proof of concept; support is on a best-effort basis.

Tested on Windows, macOS, Linux.

## Features

* WORKSPACE configuration
* JAR, AAR, source JARs
* Custom Maven servers
* Reuse artifacts from a central Coursier cache
* Supported on Windows, macOS, Linux

## Usage

List the top-level Maven artifacts and servers in the WORKSPACE:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_MAVEN_TAG = "0.0.4" # or latest tag

http_archive(
    name = "rules_maven",
    strip_prefix = "rules_maven-%s" % RULES_MAVEN_TAG,
    url = "https://github.com/jin/rules_maven/archive/%s.zip" % RULES_MAVEN_TAG,
)

load("@rules_maven//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "junit:junit:4.12",
        "androidx.test.espresso:espresso-core:3.1.1",
    ],
    repositories = [
        "https://bintray.com/bintray/jcenter",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    # Fetch srcjars as well.
    # Defaults to false.
    fetch_sources = True,
)
```

and use them directly in the BUILD file:

```python
load("@rules_maven//:defs.bzl", "artifact")

android_library(
    name = "test_deps",
    exports = [
        artifact("androidx.test.espresso:espresso-core:3.1.1"),
        # or @maven//:androidx_test_espresso_espresso_core_3_1_1
        artifact("junit:junit:4.12"),
        # or @maven//:junit_junit_4_12
    ],
)
```

## How it works

Note the lack of explicit packaging type (a la gmaven_rules). `coursier`
resolves that automatically, fetches the transitive jars using the transitive
pom files, and saves them into a central cache `~/.cache/coursier`.

The repository rule then..

1. creates the repository "@maven"
1. symlinks the transitive artifacts from the central cache to the repository's
   directory in the output_base
1. creates a single BUILD file with `java_import`/`aar_import` targets for each
   transitive artifact (including the top level ones), and their respective deps
   matching the `<dependencies>` element in the artifact's POM file.

The `artifact` macro used in the BUILD file translates the artifact fully
qualified name to the label of the top level `java_import`/`aar_import` target
in the `@maven` repository.

For example, the generated BUILD file for `com.google.inject:guice:4.0` looks like this:

```python
package(default_visibility = ["//visibility:public"])
java_import(
	name = "aopalliance_aopalliance_1_0",
	jars = ["https/repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_guava_guava_16_0_1",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/guava/16.0.1/guava-16.0.1.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_inject_guice_4_0",
	jars = ["https/repo1.maven.org/maven2/com/google/inject/guice/4.0/guice-4.0.jar"],
	deps = [
		":aopalliance_aopalliance_1_0",
		":javax_inject_javax_inject_1",
		":com_google_guava_guava_16_0_1",
	],
)
java_import(
	name = "javax_inject_javax_inject_1",
	jars = ["https/repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar"],
	deps = [
	],
)
```

For a more complex BUILD file example, [check out the one for
`com.android.support:design:28.0.0`](https://gist.github.com/jin/54f19e344db2ba930789bc3700b2838c).

The `artifact("com.google.inject:guice:4.0")` macro translates to
`@maven//:com_google_inject_guice_4_0`.

The generated repository looks like this:

```
maven/
├── BUILD
├── dep-tree.json
├── https
│   └── repo1.maven.org
│       └── maven2
│           ├── aopalliance
│           │   └── aopalliance
│           │       └── 1.0
│           │           └── aopalliance-1.0.jar -> $HOME/.cache/coursier/v1/https/repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar
│           ├── com
│           │   └── google
│           │       ├── guava
│           │       │   └── guava
│           │       │       └── 16.0.1
│           │       │           └── guava-16.0.1.jar -> $HOME/.cache/coursier/v1/https/repo1.maven.org/maven2/com/google/guava/guava/16.0.1/guava-16.0.1.jar
│           │       └── inject
│           │           └── guice
│           │               └── 4.0
│           │                   └── guice-4.0.jar -> $HOME/.cache/coursier/v1/https/repo1.maven.org/maven2/com/google/inject/guice/4.0/guice-4.0.jar
│           └── javax
│               └── inject
│                   └── javax.inject
│                       └── 1
│                           └── javax.inject-1.jar -> $HOME/.cache/coursier/v1/https/repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar
└── WORKSPACE
```

For more information, see the [unit test
data](https://github.com/jin/rules_maven/blob/master/tests/unit/coursier_testdata.bzl)
for the BUILD file generator.

## Demo

You can find demos in the [`examples/`](./examples/) directory.

## Design philosophy

- Use Starlark wherever possible (even the [JSON parser](https://github.com/erickj/bazel_json)!)
- Keep each artifact's transitive closure contained in a single repository_rule
- Cache artifacts as much as possible
- Don't reimplement the artifact resolver's semantics; reuse it
- No need to specify any transitive dependency of the top level artifact

## TODO

- [x] don't symlink to the basename; symlink to the fqn-derived path
- [x] maven server configuration
- [x] windows support
- [x] don't reexport the entire transitive closure; create the internal tree of java/aar_import based on the pom deps
- [x] [load test with different artifacts](./WORKSPACE)
- [x] more tests
- [x] srcjar support
- [x] support more packaging types than just aar, jar, and bundle
- [ ] java_plugin / annotation processor support
- [ ] migration script from gmaven_rules 
- [ ] authentication
