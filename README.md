# android-build
Dockerized Android Build image.  Optional versions with the NDK installed.

## Architecture
These Android build images are dereived from the official [gradle](https://hub.docker.com/_/gradle) image.  We also use the `gradle:5.6-jdk8` image which includes JDK 8.  We can move to `gradle:6.2-jdk8` when needed.

The main software that is added to the non-NDK versions:
* Android SDK Tools - provides the `sdkmanager` command line tool
* Kotlin - installed via SDKMAN

The sdkmanager packages that are installed are generally the current version and the previous version.  Check the Dockerfile for more details.

Example, the `android-build:29` image contains:
* android-29 and android-28
* build-tools 29.0.3-29.0.0
* build-tools 28.0.3

## Examples
Run the following command in your Android project.  The directory should be same as your `build.gradle` file.
```
docker run --rm -v ${pwd}:/home/gradle/ smithmicro/android-build:29
```

The default command of this image is `gradle build`, but you can run others.

Run a gradle clean:
```
docker run --rm -v ${pwd}:/home/gradle/ smithmicro/android-build:29 gradle clean
```

Show installed sdkmanager packages:
```
docker run --rm smithmicro/android-build:29-ndk-21 sdkmanager --list
```

## Build
To build all images containers in this repo, run:
```
./build.sh
```

## Inspiration
A great article from Medium showing the foundations this project was built on:

https://medium.com/@AndreSand/building-android-with-docker-8dbf717f54d4

## Licenses
This project is licensed under Apache 2.0.

Note that this Docker image automatically accepts two Google licenses in order to automate the installation.  By using this image, you need to accept the Terms and Conditions of these two licenses:
* Android Software Development Kit License Agreement (android-sdk-license)
* Android SDK Preview License Agreement (android-sdk-preview-license)
