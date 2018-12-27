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

    group_id, artifact_id, artifact_version = fqn.split(":")
    expected_sub_path = group_id.replace(".", "/") + "/" + artifact_id + "/" + artifact_version

    exec_result = repository_ctx.execute(
        [
            coursier,
            "fetch",
            fqn,
            "--repository",
            "https://maven.google.com",  # infer a list of this from attrs
            "--artifact-type",
            "jar,aar",
            # "--cache",
            # ".",
            "--quiet",
        ],
    )

    artifact_paths = exec_result.stdout.splitlines(keepends = False)

    all_import_labels = []
    java_imports = []
    aar_imports = []

    # The path manipulation from here on out assumes *nix paths, not Windows.
    for artifact_path in artifact_paths:
        artifact_basename = artifact_path.split("/").pop()

        # Super hacky way for generating the symlink destination
        artifact_relative_path = artifact_path.split("v1/")[1]
        repository_ctx.symlink(artifact_path, artifact_relative_path)
        artifact_packaging = artifact_basename.split(".").pop()

        if artifact_path.find(expected_sub_path) != -1:
            main_artifact_path = artifact_path

        all_import_labels.append(_escape(artifact_relative_path))

        if artifact_packaging == "jar":
            java_imports.append(
                """
java_import(
    name = "%s",
    jars = ["%s"],
)
            """ % (_escape(artifact_relative_path), artifact_relative_path),
            )
        elif artifact_packaging == "aar":
            aar_imports.append(
                """
aar_import(
    name = "%s",
    aar = "%s",
)
            """ % (_escape(artifact_relative_path), artifact_relative_path),
            )

    main_artifact_packaging = main_artifact_path.split("/").pop().split(".").pop()

    exported_labels = ",\n\t".join(['":' + label + '"' for label in all_import_labels])

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
    },
    implementation = _coursier_fetch_impl,
)
