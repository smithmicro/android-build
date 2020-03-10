FROM gradle:5.6-jdk8

# Install Build Essentials for NDK builds
RUN apt-get -y update && apt-get -y install \
    apt-utils \
    build-essential \
    file \
    zip

# From https://developer.android.com/studio/index.html
ENV ANDROID_SDK_TOOLS_VERSION=4333796
ENV ANDROID_BUILD_TOOLS_VERSION=29.0.3
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION"

# Install Android SDK Tools
RUN curl https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -O \
 && unzip -q sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -d $ANDROID_HOME \
 && rm sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && mkdir -p $ANDROID_HOME/licenses \
 && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license

# Install Android Platforms, Build Tool and Common Extras
RUN mkdir /root/.android \
 && touch /root/.android/repositories.cfg \
 && sdkmanager --update \
 && sdkmanager \
    "platforms;android-29" \
    "platforms;android-28" \
    "platform-tools" \
    "build-tools;29.0.3" \
    "build-tools;29.0.2" \
    "build-tools;29.0.1" \
    "build-tools;29.0.0" \
    "build-tools;28.0.3" \
    "patcher;v4" \
    "tools" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services"

# Install Kotlin
RUN curl "https://get.sdkman.io" -o sdkman.sh \
 && bash -c "bash ./sdkman.sh && source ~/.sdkman/bin/sdkman-init.sh && sdk install kotlin" \
 && rm sdkman.sh

# Default command line is a gradle build
CMD [ "gradle", "build" ]
