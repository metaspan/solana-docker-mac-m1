# Solana Docker for Mac M1

_**Please note this project is abandoned - I never got it working on Mac M1 and in the end I switched to Ubuntu on bare-metal.
I may return to this at a later point, but for now I am not working on this.**_

Docker config for Mac M1, to support development on Solana

# Getting started

``` bash
git clone https://github.com/metaspan/solana-docker-mac-m1
cd solana-docker-mac-m1
docker build . -t metaspan/solana-docker-mac-m1
```

# Usage

## 1st time

Note, `docker run` will create a new container. If you want to re-use this container see below.

### Command line
This will give you a bash prompt on the container
```bash
docker run -it -p 8899:8899 -p 8900:8900 --name solana metaspan/solana-docker-mac-m1
```

### Test Validator
You can start a validator directly
```bash
docker run -it -p 8899:8899 -p 8900:8900 --name solana metaspan/solana-docker-mac-m1 solana-test-validator
```

## Reuse a container

docker start solana

docker exec -it "container name" "command"
  
### Bash shell in existing, [running?] container

docker exec -it solana /bin/bash

# Refs
- https://smith-mcf.medium.com/a-simple-solana-dapp-tutorial-6dedbdf65444 (note, this is somewhat out of date)
- https://rust-lang.github.io/rustup/installation/other.html
- https://github.com/rust-lang/rust/blob/master/RELEASES.md
- https://github.com/solana-labs/solana/tree/master/sdk
- https://docs.solana.com/cli/install-solana-cli-tools#build-from-source
