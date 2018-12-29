load("@rules_maven//:coursier.bzl", "coursier_fetch")

REPOSITORY_NAME = "maven"

def maven_install(repositories = [], artifacts = []):
    coursier_fetch(
        name = REPOSITORY_NAME,
        artifacts = artifacts,
        repositories = repositories,
    )

def artifact(fqn):
    return "@%s//:%s" % (REPOSITORY_NAME, _escape_fqn(fqn))

def _escape_fqn(fqn):
    parts = fqn.split(":")
    packaging = "jar"

    if len(parts) == 3:
        group_id, artifact_id, version = parts
    elif len(parts) == 4:
        group_id, artifact_id, packaging, version = parts
    elif len(parts) == 5:
        _, _, _, classifier, _ = parts
        fail("Classifiers are currently not supported. Please remove it from the coordinate: %s" % classifier)
    else:
        fail("Invalid qualified name for artifact: %s" % fqn)

    return "%s_%s_%s" % (_escape(group_id), _escape(artifact_id), _escape(version))

def _escape(string):
    return string.replace(".", "_").replace("-", "_")
