FROM gradle:5.6-jdk8

# Install Build Essentials for NDK builds
RUN apt-get -y update && apt-get -y install \
    apt-utils \
    build-essential \
    file \
    zip

# From https://developer.android.com/studio/index.html
ENV ANDROID_SDK_TOOLS_VERSION=4333796
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="$PATH:$ANDROID_HOME/tools/bin"

# Install Android SDK Tools
RUN curl https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -O \
 && unzip -q sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -d $ANDROID_HOME \
 && rm sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip \
 && mkdir -p $ANDROID_HOME/licenses \
 && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license \
 && echo "84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license

# Install Android Platforms, Build Tool and Common Extras
RUN mkdir /root/.android \
 && touch /root/.android/repositories.cfg \
 && sdkmanager --update \
 && sdkmanager \
    "platforms;android-R" \
    "platforms;android-29" \
    "platform-tools" \
    "build-tools;30.0.0-rc1" \
    "build-tools;29.0.3" \
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
