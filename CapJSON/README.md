# Build

```
docker build -t capjson .
```

# Run

On default interface (first non-loopback):
```
docker run --net=host  -v $PWD/data/logs:/logs -it --rm --privileged capjson
```

Specify interface
```
docker run --net=host  -v $PWD/data/logs:/logs -e INTERFACE=eth1 -it --rm --privileged capjson
```
