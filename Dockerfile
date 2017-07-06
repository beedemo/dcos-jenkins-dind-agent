FROM docker:17.06.0-ce-dind

LABEL maintainer "Kurt Madel <kmadel@cloudbees.com>"

ENTRYPOINT []
CMD []

# Please keep each package list in alphabetical order
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u131
ENV JAVA_ALPINE_VERSION 8.131.11-r2

COPY wrapper.sh /usr/local/bin/

RUN set -x \
    && apk add --no-cache \
        openjdk8-jre="$JAVA_ALPINE_VERSION" \
        bash \
        git \
    	&& [ "$JAVA_HOME" = "$(docker-java-home)" ] \
        && chmod +x /usr/local/bin/wrapper.sh
