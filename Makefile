SHELL:=/usr/bin/env bash

ifeq ($(shell uname),Darwin)
	ESP32_TTY=$(shell ls /dev/tty.usbserial-* 2> /dev/null | head -n 1)
else
	ESP32_TTY=$(shell ls /dev/ttyUSB* 2> /dev/null | head -n 1)
endif

container:=podman

.PHONY: all
all: build

.PHONY: build
build:
	$(container) run --rm -v $$PWD:/project -w /project -u $$UID --userns=keep-id -e HOME=/tmp espressif/idf idf.py build

.PHONY: flash
flash:
	$(container) run --rm -v $$PWD:/project -w /project -u $$UID --userns=keep-id -e HOME=/tmp --device=$(ESP32_TTY):$(ESP32_TTY) espressif/idf idf.py flash

.PHONY: monitor
monitor:
	$(container) run -it --rm -v $$PWD:/project -w /project -u $$UID --userns=keep-id -e HOME=/tmp --device=$(ESP32_TTY):$(ESP32_TTY) espressif/idf idf.py monitor
