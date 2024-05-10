FROM gradle:8.2-jdk17

# Install Build Essentials for NDK builds
RUN apt-get -y update && apt-get -y install \
    apt-utils \
    build-essential \
    file \
    zip

ENV ANDROID_SDK_TOOLS_VERSION=10406996_latest
ENV ANDROID_BUILD_TOOLS_VERSION=34.0.0-rc3
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION"

# Install Android SDK Tools
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -O \
 && unzip -q commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && rm commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && mkdir -p $ANDROID_SDK_ROOT/cmdline-tools \
 && mv cmdline-tools latest \
 && mv latest $ANDROID_SDK_ROOT/cmdline-tools \
 && mkdir -p $ANDROID_SDK_ROOT/licenses \
 && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_SDK_ROOT/licenses/android-sdk-license

# Install Android Platforms, Build Tool, Common Extras and remove any installed emulators
RUN mkdir /root/.android \
 && touch /root/.android/repositories.cfg \
 && sdkmanager --update \
 && sdkmanager \
    "platforms;android-34" \
    "build-tools;34.0.0" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
 && sdkmanager --uninstall \
    "emulator" \
 && chown -vR gradle:gradle /opt/android-sdk

# Install Kotlin
RUN curl "https://get.sdkman.io" -o sdkman.sh \
 && bash -c "bash ./sdkman.sh && source ~/.sdkman/bin/sdkman-init.sh && sdk install kotlin" \
 && rm sdkman.sh

USER gradle

# Default command line is a gradle build
CMD [ "gradle", "build" ]
