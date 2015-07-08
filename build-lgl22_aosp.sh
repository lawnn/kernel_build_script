#!/bin/bash

export BUILD_TARGET=AOSP
. lgl22.config

time ./_build-bootimg.sh $1
