
ckerfile to build an image with the local version of golang.org/x/mobile.
#
#  > docker build -t mobile $GOPATH/src/golang.org/x/mobile
#  > docker run -it --rm -v $GOPATH/src:/src mobile

FROM ubuntu:12.04

# Install system-level dependencies.
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
	echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get update && \
	apt-get -y install build-essential python-software-properties bzip2 unzip curl \
		git subversion mercurial bzr \
		libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \
	add-apt-repository ppa:webupd8team/java && \
	apt-get update && \
	apt-get -y install oracle-java6-installer

# Install Ant.

# Update PATH for the above.
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$NDK_ROOT
ENV PATH $PATH:$ANT_HOME/bin
#ENV PATH $PATH:$GRADLE_HOME/bin
