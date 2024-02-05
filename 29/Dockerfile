FROM gradle:6.5-jdk8

# Install Build Essentials for NDK builds
RUN apt-get -y update && apt-get -y install \
    apt-utils \
    build-essential \
    file \
    zip

# From https://developer.android.com/studio/index.html
ENV ANDROID_SDK_TOOLS_VERSION=6858069_latest
ENV ANDROID_BUILD_TOOLS_VERSION=29.0.3
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/$ANDROID_SDK_TOOLS_VERSION/bin:$ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION"

# Install Android SDK Tools
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -O \
 && unzip -q commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && rm commandlinetools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && mkdir -p $ANDROID_SDK_ROOT/cmdline-tools \
 && mv cmdline-tools $ANDROID_SDK_TOOLS_VERSION \
 && mv $ANDROID_SDK_TOOLS_VERSION $ANDROID_SDK_ROOT/cmdline-tools \
 && mkdir -p $ANDROID_SDK_ROOT/licenses \
 && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_SDK_ROOT/licenses/android-sdk-license

# Install Android Platforms, Build Tool, Common Extras and remove any installed emulators
RUN mkdir /root/.android \
 && touch /root/.android/repositories.cfg \
 && sdkmanager --update \
 && sdkmanager \
    "platforms;android-29" \
    "platforms;android-28" \
    "build-tools;29.0.3" \
    "build-tools;28.0.3" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
 && sdkmanager --uninstall \
    "emulator"

# Install Kotlin
RUN curl "https://get.sdkman.io" -o sdkman.sh \
 && bash -c "bash ./sdkman.sh && source ~/.sdkman/bin/sdkman-init.sh && sdk install kotlin" \
 && rm sdkman.sh

USER gradle

# Default command line is a gradle build
CMD [ "gradle", "build" ]
