FROM smithmicro/android-build:32

ENV ANDROID_NDK_VERSION=24.0.8215888
ENV ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$ANDROID_NDK_VERSION

USER root

# Install the NDK
RUN sdkmanager "ndk;$ANDROID_NDK_VERSION" \
 && chown -vR gradle:gradle /opt/android-sdk

USER gradle
