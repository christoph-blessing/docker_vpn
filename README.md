# docker_vpn

Run openconnect VPN client inside a Docker container.

This allows one to share the same VPN connection between (many) different containers.

## Setup

1. Specify credentials in `.env` file (see `env-example` for reference)

2. Start VPN Container:

```shell
> docker run -d --privileged --name myvpn --env-file .env cblessing24/vpn:0.1
```

3. Start your Containers:

```shell
> docker run --net container:myvpn --name mycontainer myimage
> docker run --net container:myvpn --name myothercontainer myimage
> ...
```

The important part here is `--net container:myvpn`. This option tells Docker to reuse the network stack of the `myvpn` container.

### docker-compose

Here is the same example using docker-compose:

```yml
version: "3.9"
services:
  vpn:
    image: cblessing24/vpn:0.1
    privileged: true
    name: myvpn
    env_file:
      - .env
  myservice:
    image: myimage
    network_mode: "container:myvpn"
    name: mycontainer
  myotherservice:
    image: myimage
    network_mode: "container:myvpn"
    name: myothercontainer
```
