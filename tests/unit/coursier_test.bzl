load("@bazel_skylib//lib:unittest.bzl", "unittest", "asserts")
load("@bazel_json//lib:json_parser.bzl", "json_parse")
load(":coursier_testdata.bzl", "TEST_PAIRS")
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

    for (json_input, expected_build_file) in TEST_PAIRS:
        GUAVA_ACTUAL_BUILD = generate_imports(mock_repository_ctx, json_parse(json_input), {})
        asserts.equals(env, expected_build_file, GUAVA_ACTUAL_BUILD)

    unittest.end(env)

coursier_test = unittest.make(_coursier_test_impl)

def coursier_test_suite():
    unittest.suite(
        "coursier_tests",
        coursier_test,
    )
