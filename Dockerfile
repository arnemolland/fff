FROM cirrusci/flutter:stable
USER root
ENV ANDROID_PLATFORM_VERSION=30
ENV ANDROID_BUILD_TOOLS_VERSION=30.0.2
ENV GEM_HOME="$HOME/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN apt-get update && \
	apt-get install -y ruby && \
	gem install bundler && \
	curl -sL https://firebase.tools | bash && \
	/bin/sh -c yes | sdkmanager "platforms;android-$ANDROID_PLATFORM_VERSION" "build-tools;$ANDROID_BUILD_TOOLS_VERSION" && \
	mkdir -p $HOME/.fastlane

RUN sudo chown -R 777 $GEM_HOME $ANDROID_HOME $HOME/.fastlane
