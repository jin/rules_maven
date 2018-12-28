_BUILD = """
package(default_visibility = ["//visibility:public"])
{main_artifact_library}

{java_imports}

{aar_imports}
"""

def _escape(string):
    return string.replace(".", "_").replace("-", "_").replace(":", "_").replace("/", "_")

def _coursier_fetch_impl(repository_ctx):
    coursier = repository_ctx.path(repository_ctx.attr._coursier)
    fqn = repository_ctx.attr.fqn

    java_home = repository_ctx.os.environ.get("JAVA_HOME")

    if java_home != None:
        # https://github.com/coursier/coursier/blob/master/doc/FORMER-README.md#how-can-the-launcher-be-run-on-windows-or-manually-with-the-java-program
        # The -noverify option seems to be required after the proguarding step of the main JAR of coursier.
        java = repository_ctx.path(java_home + "/bin/java")
        cmd = [java, "-noverify", "-jar", coursier]
    elif repository_ctx.which("java") != None:
        # Use 'java' from $PATH
        cmd = [repository_ctx.which("java"), "-noverify", "-jar", coursier]
    else:
        # Try to execute coursier directly
        cmd = [coursier]

    # Try running coursier once
    exec_result = repository_ctx.execute(cmd)

    if exec_result.return_code != 0:
        fail("Unable to run coursier: " + exec_result.stderr)

    cmd.extend(["fetch", fqn])
    cmd.extend(["--artifact-type", "jar,aar"])
    cmd.append("--quiet")
    for repository in repository_ctx.attr.repositories:
        cmd.extend(["--repository", repository])

    exec_result = repository_ctx.execute(cmd)
    if (exec_result.return_code != 0):
        fail("Error while fetching artifact with coursier: " + exec_result.stderr)

    # Once coursier finishes a fetch, it prints out the absolute paths of
    # all fetched artifacts in the transitive closure of the requested artifact.
    # We use that as the source of truth to generate the repository's BUILD file.
    artifact_absolute_paths = exec_result.stdout.splitlines(keepends = False)

    all_import_labels = []
    java_imports = []
    aar_imports = []

    # We use this to determine which downloaded artifact is the top level
    # requested artifact.
    group_id, artifact_id, artifact_version = fqn.split(":")
    expected_sub_path = group_id.replace(".", "/") + "/" + artifact_id + "/" + artifact_version

    # Generate BUILD file with java_import and aar_import for each artifact in
    # the transitive closure, and a top level android_library OR java_library
    # that exports all of the imported artifacts (for strict deps).
    #
    # The path manipulation from here on out assumes *nix paths, not Windows.
    for artifact_absolute_path in artifact_absolute_paths:
        # Super hacky way for generating the symlink destination may break for
        # custom cache paths.
        #
        # Also replace '\' with '/` to normalize windows
        # paths to *nix style paths BUILD files accept only *nix paths, so we
        # normalize them here.
        absolute_path_parts = artifact_absolute_path.replace("\\", "/").split("v1/")
        if len(absolute_path_parts) != 2:
            fail("Error while trying to parse the path of downloaded artifact: " + artifact_absolute_path)
        else:
            artifact_relative_path = absolute_path_parts[1]
        all_import_labels.append(_escape(artifact_relative_path))

        # Make a symlink from the absolute path of the artifact to the relative
        # path within the output_base/external.
        repository_ctx.symlink(artifact_absolute_path, artifact_relative_path)

        if artifact_relative_path.find(expected_sub_path) != -1:
            main_artifact_relative_path = artifact_relative_path
            main_artifact_packaging = main_artifact_relative_path.split("/").pop().split(".").pop()

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

    # aggregate and format all exported target names as BUILD file labels
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
        False,  # not executable
    )

coursier_fetch = repository_rule(
    attrs = {
        "_coursier": attr.label(default = "//:third_party/coursier/coursier"),  # vendor coursier, it's just a jar
        "fqn": attr.string(mandatory = True),  # fully qualified name
        "repositories": attr.string_list(),  # list of repositories
    },
    environ = ["JAVA_HOME"],
    implementation = _coursier_fetch_impl,
)
