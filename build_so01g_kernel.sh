#!/bin/bash

export BUILD_TARGET=AOSP
. so01g.config

time ./_build-bootimg.sh $1
