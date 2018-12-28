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
    artifacts = {
        "junit:junit:4.12": "",
        "com.google.inject:guice:4.0": "",
        "org.hamcrest:java-hamcrest:2.0.0.0": "",
        "androidx.test.espresso:espresso-core:3.1.1": "",
        "androidx.test:runner:1.1.1": "",
        "androidx.test.ext:junit:1.1.0": "",
    },
    repositories = [
        # "https://bintray.com/bintray/jcenter",
        # "https://repo1.maven.org/maven2/org/apache",
        "https://maven.google.com",
    ],
)

android_sdk_repository(name = "androidsdk")

# End test dependencies
