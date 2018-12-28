load("@rules_maven//:defs.bzl", "artifact")

java_binary(
    name = "test_deps",
    main_class = "not.used",
    runtime_deps = [
        artifact("junit:junit:4.12"),
        artifact("com.google.inject:guice:4.0"),
        artifact("org.hamcrest:java-hamcrest:2.0.0.0"),
    ],
)
