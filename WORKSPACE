android_sdk_repository(name = "androidsdk")

local_repository(
    name = "rules_maven",
    path = "/usr/local/google/home/jingwen/code/coursier/rules_maven/",
)

load("@rules_maven//:defs.bzl", "maven_install")

maven_install(
    artifacts = {
        # fqn : sha256
        "android.arch.lifecycle:common:1.1.1": "",
        "android.arch.lifecycle:viewmodel:1.1.1": "",
    },
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org",
    ],
)
