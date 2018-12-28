load("@bazel_json//lib:json_parser.bzl", "json_parse")

_BUILD = """
package(default_visibility = ["//visibility:public"])
{imports}
"""

# Generate BUILD file with java_import and aar_import for each artifact in
# the transitive closure, with their respective deps mapped to the resolved
# tree.
def _generate_imports(repository_ctx, dep_tree):
    fetched_artifacts = dep_tree["dependencies"]
    all_imports = []
    for artifact in fetched_artifacts:
        absolute_path_to_artifact = artifact["file"]
        if absolute_path_to_artifact != None:
            # The path manipulation from here on out assumes *nix paths, not Windows.
            # for artifact_absolute_path in artifact_absolute_paths:
            #
            # Also replace '\' with '/` to normalize windows paths to *nix style paths
            # BUILD files accept only *nix paths, so we normalize them here.
            #
            # We assume that coursier uses the default cache location
            # TODO(jin): allow custom cache locations
            absolute_path_parts = absolute_path_to_artifact.replace("\\\\", "/").split("v1/")
            if len(absolute_path_parts) != 2:
                fail("Error while trying to parse the path of downloaded artifact: " + absolute_path_to_artifact)
            else:
                artifact_relative_path = absolute_path_parts[1]

            # Make a symlink from the absolute path of the artifact to the relative
            # path within the output_base/external.
            repository_ctx.symlink(absolute_path_to_artifact, repository_ctx.path(artifact_relative_path))

            packaging = artifact_relative_path.split(".").pop()

            if packaging == "jar":
                target_import_string = ["java_import("]
            elif packaging == "aar":
                target_import_string = ["aar_import("]
            else:
                fail("Unsupported packaging type: " + packaging)

            target_import_string.append("\tname = \"%s\"," % _escape(artifact["coord"]))

            if packaging == "jar":
                target_import_string.append("\tjars = [\"%s\"]," % artifact_relative_path)
            elif packaging == "aar":
                target_import_string.append("\taar = \"%s\"," % artifact_relative_path)

            target_import_string.append("\tdeps = [")
            artifact_deps = artifact["dependencies"]
            for dep in artifact_deps:
                target_import_string.append("\t\t\":%s\"," % _escape(dep))
            target_import_string.append("\t],")
            target_import_string.append(")")

            all_imports.append("\n".join(target_import_string))
        else:
            fail("The artifact for " +
                 artifact["coord"] +
                 " was not downloaded. Perhaps the packaging type is not one of: jar, aar, bundle?\n" +
                 "Parsed artifact data:" + artifact)

    return "\n".join(all_imports)

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
    cmd.extend(["--artifact-type", "jar,aar,bundle"])
    cmd.append("--quiet")
    cmd.extend(["--json-output-file", "dep-tree.json"])
    for repository in repository_ctx.attr.repositories:
        cmd.extend(["--repository", repository])

    exec_result = repository_ctx.execute(cmd)
    if (exec_result.return_code != 0):
        fail("Error while fetching artifact with coursier: " + exec_result.stderr)

    # Once coursier finishes a fetch, it generates a tree of artifacts and their
    # transitive dependencies in a JSON file. We use that as the source of truth
    # to generate the repository's BUILD file.
    # Fow Windows, use cat from msys.
    # TODO(jin): figure out why we can't just use "type". CreateProcessW complains that "type" can't be found.
    cat = "C:\\msys64\\usr\\bin\\cat" if (repository_ctx.os.name.find("windows") != 1) else repository_ctx.which("cat")
    res = repository_ctx.execute([cat, repository_ctx.path("dep-tree.json")])
    dep_tree_json = res.stdout
    dep_tree = json_parse(dep_tree_json)
    imports = _generate_imports(repository_ctx, dep_tree)

    repository_ctx.file(
        "BUILD",
        _BUILD.format(imports = imports),
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
