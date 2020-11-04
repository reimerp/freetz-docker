all: lint build

build:
        docker build -t pttrr/freetz-ng .
.PHONY: build

clean:
        -docker rmi pttrr/freetz-ng
.PHONY: clean

lint:
        shellcheck *.sh
.PHONY: lint
