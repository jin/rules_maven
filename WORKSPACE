workspace(name = "rules_maven")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BAZEL_JSON_COMMIT = "e954ef2c28cd92d97304810e8999e1141e2b5cc8"

http_archive(
    name = "bazel_json",
    strip_prefix = "bazel_json-%s" % BAZEL_JSON_COMMIT,
    url = "https://github.com/erickj/bazel_json/archive/%s.zip" % BAZEL_JSON_COMMIT,
)
# Begin test dependencies

load("//:defs.bzl", "maven_install")

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

BAZEL_SKYLIB_TAG = "0.6.0"

http_archive(
    name = "bazel_skylib",
    strip_prefix = "bazel-skylib-%s" % BAZEL_SKYLIB_TAG,
    url = "https://github.com/bazelbuild/bazel-skylib/archive/%s.tar.gz" % BAZEL_SKYLIB_TAG,
)

# load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
# bazel_skylib_workspace()

# End test dependencies
