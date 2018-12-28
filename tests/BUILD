load("@rules_maven//:defs.bzl", "artifact")

java_binary(
    name = "java_binary_test",
    main_class = "not.used",
    runtime_deps = [
        artifact("junit:junit:4.12"),
        artifact("com.google.inject:guice:4.0"),
        artifact("org.hamcrest:java-hamcrest:2.0.0.0"),
    ],
)

android_binary(
    name = "android_binary_test",
    custom_package = "not.used",
    manifest = "AndroidManifest.xml",
    deps = [
        artifact("androidx.test.espresso:espresso-core:3.1.1"),
        artifact("androidx.test:runner:1.1.1"),
        artifact("androidx.test.ext:junit:1.1.0"),
    ],
)
