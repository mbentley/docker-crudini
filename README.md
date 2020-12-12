# mbentley/crudini

docker image for [crudini](https://github.com/pixelb/crudini)
based off of debian:sid

To pull this image:
`docker pull mbentley/crudini`

Example usage:

```
docker run -t --rm \
  -u "$(id -u):$(id -g)" \
  -w /data \
  -v "${HOME}/.aws:/data:ro" \
  mbentley/crudini \
  --get credentials production aws_secret_access_key
```

There is also a helper script [cruidini.sh](./crudini.sh) which can by symlinked to `/usr/local/bin/crudini` and it should replace most functionality via container

```
# from the git repo directory
ln -s ${PWD}/crudini.sh /usr/local/bin/crudini
```

And then you could run the command like you would natively.  Using the example above:

```
crudini --get credentials production aws_secret_access_key
```
