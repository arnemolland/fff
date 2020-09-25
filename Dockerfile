FROM cirrusci/flutter:stable
USER root
ENV ANDROID_PLATFORM_VERSION=30
ENV ANDROID_BUILD_TOOLS_VERSION=30.0.0
ENV PATH="/.gem/bin:${PATH}"
ENV GEM_HOME="/.gem"
RUN apt-get update && \
	apt-get install -y ruby && \
	gem install fastlane -NV && \
	gem install bundler && \
	curl -sL https://firebase.tools | bash && \
	/bin/sh -c yes | sdkmanager "platforms;android-$ANDROID_PLATFORM_VERSION" "build-tools;$ANDROID_BUILD_TOOLS_VERSION"