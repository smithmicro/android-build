# android-build
Dockerized Android Build image.  Optional versions with the NDK installed.

## Architecture
These Android build images are dereived from the official [gradle](https://hub.docker.com/_/gradle) image.  We use the `gradle:6.7-jdk11` image in the latest build which includes JDK 11.  This gradle version is consistant with the version currently used by the latest version of Android Studio.  Older images still use `gradle:6.5-jdk8`.

The main software that is added to the non-NDK versions:
* Android SDK Tools - provides the `sdkmanager` command line tool
* Kotlin - installed via SDKMAN

The sdkmanager packages that are installed are generally the current version and the previous version.  Check the Dockerfile for more details.

## Examples
Run the following command in your Android project.  The directory should be same as your `build.gradle` file.
```
docker run --rm -v ${PWD}:/home/gradle/ smithmicro/android-build:31
```

The default command of this image is `gradle build`, but you can run others.

Run a gradle clean:
```
docker run --rm -v ${PWD}:/home/gradle/ smithmicro/android-build:31 gradle clean
```

Show installed sdkmanager packages:
```
docker run --rm smithmicro/android-build:31-ndk21 sdkmanager --list
```

## Build
To build all images containers in this repo, run:
```
./build.sh
```

## NDK Versions
These images include the following NDK versions:
|Image|NDK Version|
|---|----|
|:31-ndk21|21.4.7075529|
|:30-ndk21, :29-ndk21, :28-ndk21|21.3.6528147|
|:29-ndk20, :28-ndk20|20.1.5948944|

You can check to see if there are newer NDK versions here:

https://developer.android.com/ndk/downloads

## Extenison
If you need an additional tools inside the image, such as Ant, create your own Dockerfile to extend `android-build`:
```
FROM smithmicro/android-build:31

# Install Ant and Ant Tasks
RUN apt-get -y install \
    ant \
    ant-contrib
```

## Inspiration
A great article from Medium showing the foundations this project was built on:

https://medium.com/@AndreSand/building-android-with-docker-8dbf717f54d4

## Android References
Command-Line Tools Location
https://developer.android.com/studio/command-line#tools-sdk

Android SDK environment variables
https://developer.android.com/studio/command-line/variables#envar

## Licenses
This project is licensed under Apache 2.0.

Note that this Docker image automatically accepts two Google licenses in order to automate the installation.  By using this image, you need to accept the Terms and Conditions of this license:
* Android Software Development Kit License Agreement (android-sdk-license)
