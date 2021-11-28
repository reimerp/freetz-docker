FROM ubuntu:rolling

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
      kmod execstack rsync locales \
 && rm -rf /var/lib/apt/lists/*

RUN useradd freetz \
 && mkdir -p /home/freetz \
 && chown -R freetz /home/freetz \
 && mkdir -p /freetz/images \
 && chown -R freetz /freetz \
 && mkdir -p /patches \
 && chown -R freetz /patches

# en_US.UTF-8 in a prereq for uClibc
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen

WORKDIR /freetz
USER freetz

VOLUME /freetz/images

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
CMD ["build", "master"]
