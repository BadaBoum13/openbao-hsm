# openbao-hsm

OpenBao UBI image with [SoftHSM](https://www.opendnssec.org/softhsm/) added, for local development and testing of the PKCS#11 seal.

Built from [`quay.io/openbao/openbao-hsm-ubi`](https://quay.io/repository/openbao/openbao-hsm-ubi) with `softhsm` installed from EPEL.

## Image

Published to GitHub Container Registry:

```
ghcr.io/<owner>/openbao-hsm
```

Replace `<owner>` with the GitHub user or org that owns this repository.

### Tags

| Trigger             | Tag                          |
| ------------------- | ---------------------------- |
| Git tag `vX.Y.Z`    | `vX.Y.Z`, `latest`           |
| Monthly cron (main) | `monthly-YYYYMMDD`, `latest` |
| Pull request        | built but not pushed         |

The monthly rebuild picks up the latest upstream base image and EPEL updates.

## Build locally

```sh
docker build -t openbao-hsm .
```

## Usage

The `softhsm2-util` binary and `libsofthsm2.so` (PKCS#11 module) are available in the image. Default SoftHSM paths:

- Config: `/etc/softhsm2.conf`
- Token store: `/var/lib/softhsm/tokens`
- PKCS#11 module: `/usr/lib64/pkcs11/libsofthsm2.so`

Example: initialize a token and run an interactive shell.

```sh
docker run --rm -it --entrypoint /bin/bash ghcr.io/<owner>/openbao-hsm
softhsm2-util --init-token --slot 0 --label test --so-pin 1234 --pin 1234
```

## License

[MPL-2.0](LICENSE)
