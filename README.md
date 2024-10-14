# esp-idf-house_lights


## Building
```
podman run --rm -v $PWD:/project -w /project -u $UID --userns=keep-id -e HOME=/tmp espressif/idf idf.py build
```
Or
```
docker run --rm -v $PWD:/project -w /project -u $UID -e HOME=/tmp espressif/idf idf.py build
```
