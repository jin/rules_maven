workspace(name = "rules_maven")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BAZEL_JSON_COMMIT = "0d26dfd8d22c8d5476f1e49f6a9547e0f030fb8f"

http_archive(
    name = "bazel_json",
    strip_prefix = "bazel_json-%s" % BAZEL_JSON_COMMIT,
    url = "https://github.com/erickj/bazel_json/archive/%s.zip" % BAZEL_JSON_COMMIT,
)

load("//:defs.bzl", "maven_install")

# Begin test dependencies

maven_install(
    artifacts = [
        "androidx.test.espresso:espresso-core:3.1.1",
        "androidx.test.ext:junit:1.1.0",
        "androidx.test:runner:1.1.1",
        "com.android.support:design:28.0.0",
        "com.google.android.gms:play-services-maps:16.0.0",
        "com.google.code.gson:gson:2.8.5",
        "com.google.guava:guava:27.0-android",
        "com.google.guava:guava:27.0-jre",
        "com.google.inject:guice:4.0",
        "commons-io:commons-io:2.6",
        "io.reactivex.rxjava2:rxjava:2.2.4",
        "junit:junit:4.12",
        "org.hamcrest:java-hamcrest:2.0.0.0",
        "org.mockito:mockito-core:2.22.0",
        "org.springframework:spring-core:5.1.3.RELEASE",
    ],
    repositories = [
        "https://bintray.com/bintray/jcenter",
        "https://maven.google.com",
    ],
)

android_sdk_repository(name = "androidsdk")

# End test dependencies
