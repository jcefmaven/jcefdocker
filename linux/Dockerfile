#Step 1: Use debian with preinstalled python 3.7
FROM python:3.7-slim-bullseye

#Step 2: Install Eclipse Temurin (Java)
ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:11 $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

#Required packages according to https://bitbucket.org/chromiumembedded/java-cef/wiki/BranchesAndBuilding
#CMake, Git, a C compiler (gcc), Java, Python, build-essential, libgtk2.0-dev (sub packages), ninja (for building)
#Additional tools for creating distribution: rsync
ENV TOOLS cmake git gcc build-essential libgtk2.0-dev ninja-build rsync

#Additional libraries for slim image
ENV LIBS libnss3 libnspr4 libatk-bridge2.0-0 libdrm2 libxkbcommon0 libgbm1 libasound2 libatspi2.0-0 libxshmfence1

#Step 3: Install tools
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends $TOOLS $LIBS

#Step 4: Setup entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
