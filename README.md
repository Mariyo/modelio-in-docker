[Modelio](https://www.modelio.org) 4.1.0 in a docker container

# Requirements

* Docker (https://www.docker.com) running
* X11

# Setup (perform once)

```sh
git clone https://github.com/Mariyo/modelio-in-docker && cd modelio-in-docker && chmod +x run.sh
```

# Running

Launch the `run.sh` script

```sh
./run.sh
```

OpenJDK 8 is installed in `/usr/lib/jvm/java-8-openjdk-amd64` (for use in Java Designer module's parameters).