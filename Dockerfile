FROM cirrusci/flutter:stable
USER root
RUN apt-get update && \
	apt-get install -y ruby && \
	gem install fastlane -NV && \
	gem install bundler && \
	curl -sL https://firebase.tools | bash
USER cirrus