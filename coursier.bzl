_BUILD = """
package(default_visibility = ["//visibility:public"])
{main_artifact_library}

{java_imports}

{aar_imports}
"""

def _escape(string):
    return string.replace(".", "_").replace("-", "_").replace(":", "_").replace("/", "_")

def _is_windows(repository_ctx):
    # Windows 10 returns "windows 10"
    return repository_ctx.os.name.find("windows") != -1

def _coursier_fetch_impl(repository_ctx):
    coursier = repository_ctx.path(repository_ctx.attr._coursier)
    fqn = repository_ctx.attr.fqn

    if _is_windows(repository_ctx):
        # https://github.com/coursier/coursier/blob/master/doc/FORMER-README.md#how-can-the-launcher-be-run-on-windows-or-manually-with-the-java-program
        # The -noverify option seems to be required after the proguarding step of the main JAR of coursier.
        java_home = repository_ctx.os.environ["JAVA_HOME"]
        java = repository_ctx.path(java_home + "/bin/java")
        cmd = [java, "-noverify", "-jar", coursier, "fetch", fqn]
    else:
        # OSX and Darwin doesn't require the java launcher
        cmd = [coursier, "fetch", fqn]
    cmd.extend(["--artifact-type", "jar,aar"])
    cmd.append("--quiet")
    for repository in repository_ctx.attr.repositories:
        cmd.extend(["--repository", repository])

    exec_result = repository_ctx.execute(cmd)

    if (exec_result.return_code != 0):
        fail("Error while fetching artifact with coursier: " + exec_result.stderr)

    artifact_absolute_paths = exec_result.stdout.splitlines(keepends = False)

    all_import_labels = []
    java_imports = []
    aar_imports = []

    group_id, artifact_id, artifact_version = fqn.split(":")
    expected_sub_path = group_id.replace(".", "/") + "/" + artifact_id + "/" + artifact_version

    # The path manipulation from here on out assumes *nix paths, not Windows.
    for artifact_absolute_path in artifact_absolute_paths:
        # Super hacky way for generating the symlink destination
        # may break for custom cache paths
        # also replace '\' with '/` to normalize windows paths to *nix style paths
        # BUILD files accept only *nix paths, so we normalize them here.
        artifact_relative_path = artifact_absolute_path.replace("\\", "/").split("v1/")[1]
        repository_ctx.symlink(artifact_absolute_path, artifact_relative_path)

        if artifact_relative_path.find(expected_sub_path) != -1:
            main_artifact_relative_path = artifact_relative_path
            main_artifact_packaging = main_artifact_relative_path.split("/").pop().split(".").pop()

        all_import_labels.append(_escape(artifact_relative_path))
        artifact_packaging = artifact_relative_path.split("/").pop().split(".").pop()
        if artifact_packaging == "jar":
            java_imports.append(
                """
java_import(
    name = "%s",
    jars = ["%s"],
)""" % (_escape(artifact_relative_path), artifact_relative_path),
            )
        elif artifact_packaging == "aar":
            aar_imports.append("""
aar_import(
    name = "%s",
    aar = "%s",
)""" % (_escape(artifact_relative_path), artifact_relative_path))

    exported_labels = ",\n\t\t".join(['":' + label + '"' for label in all_import_labels])

    if main_artifact_packaging == "jar":
        main_artifact_library = """
java_library(
    name = "%s",
    exports = [
        %s
    ],
)
""" % (_escape(fqn), exported_labels)
    elif main_artifact_packaging == "aar":
        main_artifact_library = """
android_library(
    name = "%s",
    exports = [
        %s
    ],
)
""" % (_escape(fqn), exported_labels)

    repository_ctx.file(
        "BUILD",
        _BUILD.format(
            main_artifact_library = main_artifact_library,
            java_imports = "\n".join(java_imports),
            aar_imports = "\n".join(aar_imports),
        ),
        False,
    )

coursier_fetch = repository_rule(
    attrs = {
        "_coursier": attr.label(default = "//:coursier"),
        "fqn": attr.string(mandatory = True),
        "repositories": attr.string_list(),
    },
    environ = ["JAVA_HOME"],
    implementation = _coursier_fetch_impl,
)
