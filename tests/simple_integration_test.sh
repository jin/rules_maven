#!/bin/bash

set -eux

readonly SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

bazel build //tests:test_deps_deploy.jar
jar tf $SCRIPT_DIR/../bazel-bin/tests/test_deps_deploy.jar | sort > /tmp/jar_contents.actual
diff $SCRIPT_DIR/jar_contents.golden /tmp/jar_contents.actual
