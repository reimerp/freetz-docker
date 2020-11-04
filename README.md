# pttrr/freetz-ng-docker

This repository holds files for the `pttrr/freetz-ng-docker` Docker image, a [Freetz-NG](https://github.com/Freetz-NG/freetz-ng) image build environment.

This is a fork from [mtneug-freetz](https://github.com/mtneug/freetz-docker)
## Usage

To build images you either can interactively use the `menuconfig` or a configuration file. Below you find some examples:

```sh
# Build
$ docker build --no-cache -t pttrr/freetz-ng-docker
# Build with menuconfig
$ docker run --rm -it -v $PWD/images:/freetz/images pttrr/freetz-ng-docker

# Build with predefined .config
$ docker run --rm -it -v $PWD/images:/freetz/images -v $PWD/config:/.config pttrr/freetz-ng-docker

# Build with patches
# put your .patch files into $PWD/patches
$ docker run --rm -it -v $PWD/patches:/patches -v $PWD/images:/freetz/images pttrr/freetz-ng-docker
```

There are also some other commands:

```sh
$ docker run --rm pttrr/freetz-ng-docker help
Usage:
  build [branch]          Builds a Freetz image from [branch]
    --no-menuconfig         Do not start menuconfig
                            This is only possible if there already
                            exists a .config file in the root directory.
  clean                   Removes build output
  help                    Prints this usage information
  [cmd] [args...]         Runs [cmd] with given arguments
```
