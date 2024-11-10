# BaseOS Docker Image for Pigsty

If you wish to run Pigsty on Container based VMs, here's an example Dockerfile based on RockyLinux 8.9

Build this image with the following command:

```bash
docker build -t el8 .
```

## How to use?

To create 3 node with that image

```bash
docker network create --subnet=10.10.11.0/24 pigsty
docker run -d --name pg-test-1 -v /data/pg-test-1:/data --privileged --network pigsty --ip 10.10.11.11 el8
docker run -d --name pg-test-2 -v /data/pg-test-1:/data --privileged --network pigsty --ip 10.10.11.12 el8
docker run -d --name pg-test-3 -v /data/pg-test-1:/data --privileged --network pigsty --ip 10.10.11.13 el8
```


```
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 h.pigsty a.pigsty p.pigsty g.pigsty meta
```


## Caveat

To deploy Pigsty on container based VMs, you need to setup the following parameters in the inventory file:

```yaml
node_dns_method: none      # do not setup dns inside container
node_ntp_enabled: false    # do not setup ntp inside container
dns_enabled: falses        # do not launch DNSMASQ inside container
node_repo_modules: ''      # do not install any repo inside container
```

TODO: add `node_write_hosts` parameter to skip 