#!/bin/bash

set -e

# Android 31
docker build 31 -t smithmicro/android-build:31
docker build 31/ndk22 -t smithmicro/android-build:31-ndk22
docker build 31/ndk21 -t smithmicro/android-build:31-ndk21

# Android 30
docker build 30 -t smithmicro/android-build:30
docker build 30/ndk21 -t smithmicro/android-build:30-ndk21

# Android 29
docker build 29 -t smithmicro/android-build:29
docker build 29/ndk21 -t smithmicro/android-build:29-ndk21
docker build 29/ndk20 -t smithmicro/android-build:29-ndk20

# Android 28
docker build 28 -t smithmicro/android-build:28
docker build 28/ndk21 -t smithmicro/android-build:28-ndk21
docker build 28/ndk20 -t smithmicro/android-build:28-ndk20
