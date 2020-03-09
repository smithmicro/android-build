# android-build
Dockerized Android Build image.  Optional versions with the NDK installed.

## Examples:
Run the following command in your Android project.  The directory should be same as your `build.gradle` file.
```
docker run --rm -v "$PWD":/home/gradle/ smithmicro/android-build:29
```

The default command of this image is `gradle build`, but you can run others.

Run a gradle clean:
```
docker run --rm -v "$PWD":/home/gradle/ smithmicro/android-build:29 gradle clean
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
