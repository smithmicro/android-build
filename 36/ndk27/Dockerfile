FROM smithmicro/android-build:36

ENV ANDROID_NDK_VERSION=27.2.12479018
ENV ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$ANDROID_NDK_VERSION

USER root

# Install the NDK
RUN sdkmanager "ndk;$ANDROID_NDK_VERSION" \
 && chown -vR gradle:gradle /opt/android-sdk

USER gradle