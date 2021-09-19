# Solana Docker for Mac M1
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
docker run -it -p 8899:8899 metaspan/solana-docker-mac-m1
```

### Test Validator
You can start a validator directly
```bash
docker run -it -p 8899:8899 metaspan/solana-docker-mac-m1 solana-test-validator
```

## Reuse a container

docker start "container name"

docker exec -it "container name" "command"
  
### Bash shell in existing, [running?] container

docker exec -it "container name" /bin/bash

# Refs
- https://smith-mcf.medium.com/a-simple-solana-dapp-tutorial-6dedbdf65444 (note, this is somewhat out of date)
- https://rust-lang.github.io/rustup/installation/other.html
- https://github.com/rust-lang/rust/blob/master/RELEASES.md
- https://github.com/solana-labs/solana/tree/master/sdk
- https://docs.solana.com/cli/install-solana-cli-tools#build-from-source
