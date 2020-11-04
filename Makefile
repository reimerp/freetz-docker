all: lint build

build:
        docker build -t ptTrR/freetz-ng .
.PHONY: build

clean:
        -docker rmi ptTrR/freetz-ng
.PHONY: clean

lint:
        shellcheck *.sh
.PHONY: lint
