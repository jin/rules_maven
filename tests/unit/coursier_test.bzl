load("@bazel_skylib//:lib.bzl", "asserts", "unittest")
load("@bazel_json//lib:json_parser.bzl", "json_parse")
load(":coursier_testdata.bzl", "GUAVA_DEP_JSON")
load("//:coursier.bzl", "generate_imports")

def _mock_1_arity_fn(unused):
    pass

def _mock_2_arity_fn(unused1, unused2):
    pass

def _mock_repository_ctx():
    return struct(
        path = _mock_1_arity_fn,
        symlink = _mock_2_arity_fn,
    )

def _coursier_test_impl(ctx):
    env = unittest.begin(ctx)

    mock_repository_ctx = _mock_repository_ctx()
    guava_dep_tree = json_parse(GUAVA_DEP_JSON)

    expected = """java_import(
	name = "com_google_code_findbugs_jsr305_3_0_2",
	jars = ["https/repo1.maven.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_errorprone_error_prone_annotations_2_2_0",
	jars = ["https/repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.2.0/error_prone_annotations-2.2.0.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_guava_failureaccess_1_0",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/failureaccess/1.0/failureaccess-1.0.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_guava_guava_27_0_jre",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar"],
	deps = [
		":com_google_guava_listenablefuture_9999_0_empty_to_avoid_conflict_with_guava",
		":com_google_code_findbugs_jsr305_3_0_2",
		":com_google_guava_failureaccess_1_0",
		":org_codehaus_mojo_animal_sniffer_annotations_1_17",
		":com_google_j2objc_j2objc_annotations_1_1",
		":com_google_errorprone_error_prone_annotations_2_2_0",
		":org_checkerframework_checker_qual_2_5_2",
	],
)
java_import(
	name = "com_google_guava_listenablefuture_9999_0_empty_to_avoid_conflict_with_guava",
	jars = ["https/repo1.maven.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"],
	deps = [
	],
)
java_import(
	name = "com_google_j2objc_j2objc_annotations_1_1",
	jars = ["https/repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar"],
	deps = [
	],
)
java_import(
	name = "org_checkerframework_checker_qual_2_5_2",
	jars = ["https/repo1.maven.org/maven2/org/checkerframework/checker-qual/2.5.2/checker-qual-2.5.2.jar"],
	deps = [
	],
)
java_import(
	name = "org_codehaus_mojo_animal_sniffer_annotations_1_17",
	jars = ["https/repo1.maven.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar"],
	deps = [
	],
)"""

    asserts.equals(env, expected, generate_imports(mock_repository_ctx, guava_dep_tree, {}))
    unittest.end(env)

coursier_test = unittest.make(_coursier_test_impl)

def coursier_test_suite():
    unittest.suite(
        "coursier_tests",
        coursier_test,
    )
