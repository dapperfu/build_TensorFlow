.EXPORT_ALL_VARIABLES:
# Config

# Environments to setup for this project
# Available options: python arduino
ENVS:=python tensorflow_build

## make_sandwich includes
# https://github.com/jed-frey/make_sandwich
include .mk_inc/env.mk

bazel-0.16.1-linux-x86_64:
	curl -OL https://github.com/bazelbuild/bazel/releases/download/0.16.1/bazel-0.16.1-linux-x86_64
	chmod +x ${@}

bazel: bazel-0.16.1-linux-x86_64
	ln -s ${^} ${@}
	chmod +x ${@}

tensorflow:
	git clone --recurse-submodules --jobs=8 --branch=v1.10.1 --depth=1 https://github.com/tensorflow/tensorflow.git


.PHONY: env.tensorflow_build
env.tensorflow_build: bazel tensorflow
	${PIP} install keras_applications==1.0.5 --no-deps
	${PIP} install keras_preprocessing==1.0.3 --no-deps

.PHONY: clean2
clean2: clean
	rm -rf tensorflow
