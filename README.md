# rules_maven (or rules_coursier?)

transitive maven artifact repository rule prototype that just depends on the `coursier` cli tool.

this is a highly experimental prototype, done for a proof of concept.

## tl;dr build it

```shell
$ bazel build :my_app
INFO: Invocation ID: a32f5c70-2165-4c6c-bee1-47bc1ab91a89
INFO: Analysed target //:my_app (38 packages loaded, 730 targets configured).
INFO: Found 1 target...
Target //:my_app up-to-date:
  bazel-bin/my_app_deploy.jar
  bazel-bin/my_app_unsigned.apk
  bazel-bin/my_app.apk
INFO: Elapsed time: 9.330s, Critical Path: 8.51s
INFO: 50 processes: 37 linux-sandbox, 13 worker.
INFO: Build completed successfully, 92 total actions

$ jar tf bazel-out/k8-fastbuild/bin/my_app_deploy.jar | grep -v ".class"
META-INF/
META-INF/MANIFEST.MF
android/
android/arch/
android/arch/lifecycle/
android/support/
android/support/annotation/
META-INF/android.arch.lifecycle_viewmodel.version
javax/
javax/annotation/
javax/annotation/concurrent/
javax/annotation/meta/

... <all transitive classes>
```

## API Design

List the artifacts and servers in the WORKSPACE:

```python
local_repository(
    name = "rules_maven",
    path = "/path/to/repo",
)

load("@rules_maven//:defs.bzl", "maven_install")

maven_install(
    artifacts = {
        # fqn : sha256
        "android.arch.lifecycle:common:1.1.1": "",
        "android.arch.lifecycle:viewmodel:1.1.1": "",
        "androidx.test.espresso:espresso-web:3.1.1": "",
    },
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org",
    ],
)
```

and use them directly in the BUILD file:

```python
load("@rules_maven//:defs.bzl", "artifact")

android_library(
    name = "my_lib",
    exports = [
        artifact("android.arch.lifecycle:common:1.1.1"),
        artifact("android.arch.lifecycle:viewmodel:1.1.1"),
        artifact("androidx.test.espresso:espresso-web:3.1.1"),
    ],
)

android_binary(
    name = "my_app",
    custom_package = "com.example.bazel",
    manifest = "AndroidManifest.xml",
    deps = [":my_lib"],
)
```


Note the lack of explicit packaging type (a la gmaven_rules). `coursier` resolves that automatically, fetches the transitive jars using the transitive pom files, and saves them into a central cache `~/.cache/coursier`.

The repository rule then..

1. creates one repository for each top level artifact 
1. creates a BUILD file for each repository
1. symlinks the transitive artifacts from the central cache to the repository's directory in the output_base
1. creates java_import/aar_import for each transitive artifact (including the top level one)
1. creates a top level android_binary or android_library that exports all the transitive java_import and aar_import targets (for strict deps)

The `artifact` macro used in the BUILD file just translates the artifact FQN to the name of the repository rule.

## TODO

- [ ] don't symlink to the basename; symlink to the fqn-derived path
- [ ] load test with different artifacts
- [ ] maven server configuration
- [ ] authentication
- [ ] sha checks of transitive artifacts
- [ ] support more packaging types than just aar and jar
