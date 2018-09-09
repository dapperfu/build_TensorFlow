#!/usr/bin/env bash

bazel clean --async
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package --jobs 6
