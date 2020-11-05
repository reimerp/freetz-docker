FROM ubuntu:20.10

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      perl ruby python git-core wget curl zip bzip2 unzip xz-utils \
      binutils imagemagick build-essential make patch gcc gcc-multilib g++ \
      \
      graphicsmagick autoconf automake autopoint libtool-bin gettext \
      flex bison texinfo tofrodos pkg-config ecj fastjar gawk \
      intltool bc \
      \
      libusb-dev libacl1-dev libcap-dev libc6-dev-i386 lib32ncurses5-dev \
      lib32stdc++6 libglib2.0-dev libattr1-dev libncurses5-dev libreadline-dev \
      libstring-crc32-perl zlib1g-dev subversion inkscape  \
 && rm -rf /var/lib/apt/lists/*

RUN useradd freetz \
 && mkdir -p /home/freetz \
 && chown -R freetz /home/freetz \
 && mkdir -p /freetz/images \
 && chown -R freetz /freetz \
 && mkdir -p /patches \
 && chown -R freetz /patches

WORKDIR /freetz
USER freetz

VOLUME /freetz/images

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
CMD ["build", "master"]

E: Package 'gcc-multilib' has no installation candidate
E: Unable to locate package libc6-dev-i386
E: Unable to locate package lib32ncurses5-dev
E: Unable to locate package lib32stdc++6
E: Couldn't find any package by regex 'lib32stdc++6'
