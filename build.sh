#!/bin/bash

set -e

# Android 35
docker build 35 -t smithmicro/android-build:35
docker build 35/ndk27 -t smithmicro/android-build:35-ndk27

# Android 34
docker build 34 -t smithmicro/android-build:34
docker build 34/ndk26 -t smithmicro/android-build:34-ndk26

# Android 33
docker build 33 -t smithmicro/android-build:33
docker build 33/ndk25 -t smithmicro/android-build:33-ndk25

# Android 32
docker build 32 -t smithmicro/android-build:32
docker build 32/ndk24 -t smithmicro/android-build:32-ndk24
docker build 32/ndk23 -t smithmicro/android-build:32-ndk23

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
