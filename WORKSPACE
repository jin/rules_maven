workspace(name = "rules_maven")

# Begin test dependencies

load("//:defs.bzl", "maven_install")

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
        "https://bintray.com/bintray/jcenter",
        "https://repo1.maven.org/maven2/org/apache",
        "https://maven.google.com",
    ],
)

android_sdk_repository(name = "androidsdk")

# End test dependencies
