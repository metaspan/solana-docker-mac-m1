# Solana Docker for Mac M1
Docker config for Mac M1, to support development on Solana

# Getting started

``` bash
git clone https://github.com/metaspan/solanalabs-solana-docker-mac-m1
cd solanalabs-solana-docker-mac-m1
docker build -t metaspan/solana-docker-mac-m1
```

# Usage

```bash
docker run -it metaspan/solana-docker-mac-m1 solana-test-validator
```

# Refs
- https://rust-lang.github.io/rustup/installation/other.html
- https://github.com/rust-lang/rust/blob/master/RELEASES.md
- https://github.com/solana-labs/solana/tree/master/sdk
- https://docs.solana.com/cli/install-solana-cli-tools#build-from-source
