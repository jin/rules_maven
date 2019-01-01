load("@rules_maven//:defs.bzl", "artifact")

java_binary(
    name = "java_binary_test",
    main_class = "not.used",
    runtime_deps = [
        artifact("com.google.code.gson:gson:2.8.5"),
        artifact("com.google.guava:guava:27.0-jre"),
        artifact("com.google.inject:guice:4.0"),
        artifact("commons-io:commons-io:2.6"),
        artifact("io.reactivex.rxjava2:rxjava:2.2.4"),
        artifact("junit:junit:4.12"),
        artifact("org.hamcrest:java-hamcrest:2.0.0.0"),
        artifact("org.mockito:mockito-core:2.22.0"),
        artifact("org.springframework:spring-core:5.1.3.RELEASE"),
    ],
)

android_binary(
    name = "android_binary_test",
    custom_package = "not.used",
    manifest = "AndroidManifest.xml",
    multidex = "native",
    deps = [
        artifact("androidx.test.espresso:espresso-core:3.1.1"),
        artifact("androidx.test.ext:junit:1.1.0"),
        artifact("androidx.test:runner:1.1.1"),
        artifact("com.google.android.gms:play-services-maps:16.0.0"),
        artifact("com.google.code.gson:gson:2.8.5"),
        artifact("com.google.guava:guava:27.0-android"),
        artifact("io.reactivex.rxjava2:rxjava:2.2.4"),
        artifact("org.mockito:mockito-core:2.22.0"),
        # The Android design AAR is extremely large, and depends on transitive
        # resources from its AAR deps. If the internal dependency graph isn't
        # wired up properly, building this will fail spectacularly. This makes
        # for a good load testing target.
        artifact("com.android.support:design:28.0.0"),
    ],
)
