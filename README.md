# esp-idf-house_lights


## Building
```
podman run --rm -v $PWD:/project -w /project -u $UID --userns=keep-id -e HOME=/tmp espressif/idf idf.py build
```
Or
```
docker run --rm -v $PWD:/project -w /project -u $UID -e HOME=/tmp espressif/idf idf.py build
```

## Flashing
```
podman run --rm -v $PWD:/project -w /project -u $UID --userns=keep-id -e HOME=/tmp --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf idf.py flash
```

## Monitor
```
podman run -it --rm -v $PWD:/project -w /project -u $UID --userns=keep-id -e HOME=/tmp --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf idf.py monitor
```
