#!/bin/bash

set -eux
set -o pipefail

readonly SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# try to run it once here to bootstrap
$SCRIPT_DIR/../../third_party/coursier/coursier

# java_binary test
bazel build //tests:java_binary_test_deploy.jar
jar tf $SCRIPT_DIR/../../bazel-bin/tests/java_binary_test_deploy.jar | sort > /tmp/java_binary_deploy_jar.actual
diff $SCRIPT_DIR/java_binary_deploy_jar.golden /tmp/java_binary_deploy_jar.actual

# android_binary test
bazel build //tests:android_binary_test
jar tf $SCRIPT_DIR/../../bazel-bin/tests/android_binary_test_deploy.jar | sort > /tmp/android_binary_deploy_jar.actual
diff $SCRIPT_DIR/android_binary_deploy_jar.golden /tmp/android_binary_deploy_jar.actual
