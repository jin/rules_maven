# rules_maven

| Travis CI                                                                                                         |
| -----                                                                                                             |
| [![Build Status](https://travis-ci.org/jin/rules_maven.svg?branch=master)](https://travis-ci.org/jin/rules_maven) |

Transitive Maven artifact repository rule implementation that just depends on
the `coursier` CLI tool.

> This was made to be a proof of concept to demonstrate how Maven dependency
resolution can be done in a [Bazel Android
project](https://github.com/jaredsburrows/android-bazel-java-app-template), and
to be a possible replacement for
[gmaven_rules](https://github.com/bazelbuild/gmaven_rules).

Support is on a best-effort basis.

## Features

* WORKSPACE configuration
* JAR, AAR, source JARs
* Custom Maven repositories
* Private Maven repositories with HTTP Basic Authentication
* Artifact version resolution with Coursier
* Reuse artifacts from a central cache
* Versionless target labels for simpler dependency management
* Ability to declare multiple sets of versioned artifacts
* Supported on Windows, macOS, Linux

## Usage

List the top-level Maven artifacts and servers in the WORKSPACE:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_MAVEN_TAG = "0.1.0" # or latest tag

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
        # Private repositories are supported through HTTP Basic auth
        "http://username:password@localhost:8081/artifactory/my-repository",
        "https://bintray.com/bintray/jcenter",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    # Fetch srcjars. Defaults to False.
    fetch_sources = True,
)
```

and use them directly in the BUILD file by specifying the versionless target alias label:

```python
load("@rules_maven//:defs.bzl", "artifact")

android_library(
    name = "test_deps",
    exports = [
        "@maven//:androidx_test_espresso_espresso_core",
        # or artifact("androidx.test.espresso:espresso-core"),
        "@maven//:junit_junit",
        # or artifact("junit:junit"),
    ],
)
```

## Advanced usage

### Using a persistent artifact cache

To download artifacts into a shared and persistent directory in your home
directory, specify `use_unsafe_shared_cache = True` in `maven_install`:

```python
maven_install(
    name = "maven",
    artifacts = [
        # ...
    ],
    repositories = [
        # ...
    ],
    use_unsafe_shared_cache = True,
)
```

This is **not safe** as Bazel is currently not able to detect changes in the
shared cache. For example, if an artifact is deleted from the shared cache,
Bazel will not re-run the repository rule automatically.

The default value of `use_unsafe_shared_cache` is `False`. This means that Bazel
will create independent caches for each `maven_install` repository, located at
`$(bazel info output_base)/external/@repository_name/v1`.

### Multiple `maven_install` declarations for isolated artifact version trees

If your WORKSPACE contains several projects that use different versions of the
same artifact, you can specify multiple `maven_install` declarations in the
WORKSPACE, with a unique repository name for each of them.

For example, if you want to use the JRE version of Guava for a server app, and
the Android version for an Android app, you can specify two `maven_install`
declarations:

```python
maven_install(
    name = "server_app",
    artifacts = [
        "com.google.guava:guava:27.0-jre",
    ],
    repositories = [
        "https://repo1.maven.org/maven2",
    ],
)

maven_install(
    name = "android_app",
    artifacts = [
        "com.google.guava:guava:27.0-android",
    ],
    repositories = [
        "https://repo1.maven.org/maven2",
    ],
)
```

This way, `rules_maven` will invoke coursier to resolve artifact versions for
both repositories independent of each other. Coursier will fail if it encounters
version conflicts that it cannot resolve. The two Guava targets can then be used
in BUILD files like so:

```python
load("@rules_maven//:defs.bzl", "artifact")

java_binary(
    name = "my_server_app",
    srcs = ...
    deps = [
        # a versionless alias to @server_app//:com_google_guava_guava_27_0_jre
        "@server_app//:com_google_guava_guava",
        # or artifact("com.google.guava:guava", repository_name = "server_app")
    ]
)

android_binary(
    name = "my_android_app",
    srcs = ...
    deps = [
        # a versionless alias to @android_app//:com_google_guava_guava_27_0_android
        "@android_app//:com_google_guava_guava",
        # or artifact("com.google.guava:guava", repository_name = "android_app")
    ]
)
```

### Detailed dependency information specifications

Although you can always give a dependency as a Maven coordinate string, occasionally special
handling is required in the form of additional directives to properly situate the artifact
in the dependency tree. For example, a given artifact may need to have one of its dependencies
excluded to prevent a conflict. 

This situation is provided for by allowing the artifact to be specified as a map containing
all of the required information. This map can express more information than the coordinate
strings can, so internally the coordinate strings are parsed into the artifact map with default
values for the additional items. To assist in generating the maps, you can pull in the file 
`specs.bzl` alongside `defs.bzl` and import the `maven` struct, which provides several helper
functions to assist in creating these maps. An example: 

```python
load("@rules_maven//:defs.bzl", "artifact")
load("@rules_maven//:specs.bzl", "maven")

maven_install(
    artifacts = [
        maven.artifact(
            group = "com.google.guava",
            artifact = "guava",
            version = "27.0-android",
            exclusions = [
                ...
            ]
        ),
        "junit:junit:4.12",
        ...
    ],
    repositories = [
        maven.repository(
            "https://some.private.maven.re/po",
            user = "bob",
            password = "l0bl4w"
        ),
        "https://repo1.maven.org/maven2",
        ...
    ],
)
```

### Artifact exclusion

If you want to exclude an artifact from the transitive closure of a top level
artifact, specify its `group-id:artifact-id` in the `exclusions` attribute of
the `maven.artifact` helper:

```python
load("@rules_maven//:defs.bzl", "artifact")
load("@rules_maven//:specs.bzl", "maven")

maven_install(
    artifacts = [
        maven.artifact(
            group = "com.google.guava",
            artifact = "guava",
            version = "27.0-jre",
            exclusions = [
                maven.exclusion(
                    group = "org.codehaus.mojo",
                    artifact = "animal-sniffer-annotations"
                ),
                "com.google.j2objc:j2objc-annotations",
            ]
        ),
        # ...
    ],
    repositories = [
        # ...
    ],
)
```

You can specify the exclusion using either the `maven.exclusion` helper or the
`group-id:artifact-id` string directly.

## How it works

Note the lack of explicit packaging type (a la gmaven_rules). `coursier`
resolves that automatically, fetches the transitive jars using the transitive
pom files, and saves them into a central cache `~/.cache/coursier`.

The repository rule then..

1. creates the repository "@maven"
1. symlinks the transitive artifacts from the central cache to the repository's
   directory in the output_base
1. creates a single BUILD file with `java_import`/`aar_import` and `java_library` 
   transitive library targets for each transitive artifact (including the top level 
   ones), and their respective deps matching the `<dependencies>` element in the 
   artifact's POM file.

The `artifact` macro used in the BUILD file translates the artifact fully
qualified name to the label of the top level `java_import`/`aar_import` target
in the `@maven` repository. This macro will depend directly on the referenced jar, and
nothing else. 

The `library` macro accepts the same arguments, but references the `java_library` target
for the arguments. The library target will contain the referenced jar *and* all of its
transitive dependencies. 

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
- [x] authentication to private repositories
- [x] version resolution
- [x] one version per artifact per `@repository`
- [x] declare multiple `maven_install` to isolate artifact version trees
- [ ] java_plugin / annotation processor support
- [ ] migration script from gmaven_rules 
