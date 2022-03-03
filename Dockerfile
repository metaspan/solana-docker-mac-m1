
# FROM --platform=linux/arm64 debian:buster
# FROM ubuntu:20.04 as amd64
# FROM arm64v8/ubuntu:20.04

FROM --platform=linux/arm64 ubuntu:18.04

# RPC JSON
EXPOSE 8899/tcp
# RPC pubsub
EXPOSE 8900/tcp
# entrypoint
EXPOSE 8001/tcp
# (future) bank service
EXPOSE 8901/tcp
# bank service
EXPOSE 8902/tcp
# faucet
EXPOSE 9900/tcp
# tvu
EXPOSE 8000/udp
# gossip
EXPOSE 8001/udp
# tvu_forwards
EXPOSE 8002/udp
# tpu
EXPOSE 8003/udp

# tpu_forwards
EXPOSE 8004/udp
# retransmit
EXPOSE 8005/udp
# repair
EXPOSE 8006/udp
# serve_repair
EXPOSE 8007/udp
# broadcast
EXPOSE 8008/udp

# these run at `build` time

RUN apt update
RUN apt-get install -y bzip2 \
    libssl-dev libudev-dev clang \
    vim wget curl gcc pkg-config

ARG SOLANA_VERSION=1.9.9

RUN wget -O /opt/solana-${SOLANA_VERSION}.tar.gz https://github.com/solana-labs/solana/archive/refs/tags/v${SOLANA_VERSION}.tar.gz
# COPY solana-1.7.12.tar.gz /opt/solana-1.7.12.tar.gz

# rustup: installs cargo, clippy rust-docs, rust-std, rustc, rustfmt
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# RUN source $HOME/.cargo/env && echo $PATH
RUN . ~/.cargo/env && echo $PATH
# RUN export PATH=~/.cargo/bin:$PATH 
ENV PATH=~/.cargo/bin:$PATH

RUN cd /opt; tar -xvf solana-${SOLANA_VERSION}.tar.gz
RUN cd /opt/solana-${SOLANA_VERSION}; ./scripts/cargo-install-all.sh .

ENV PATH=/opt/solana-${SOLANA_VERSION}/bin:$PATH

# # Create a .profile
# RUN echo 'PATH=$PATH:$PATH:~/.cargo/bin:/opt/solana-1.7.12/bin' >> ~/.profile
# # Create a .bash_profile
# RUN echo 'PATH=$PATH:/$PATH:~/.cargo/bin:/opt/solana-1.7.12/bin' >> ~/.bash_profile

# Update bashrc
RUN echo 'PATH=$PATH:/$PATH:/opt/solana-${SOLANA_VERSION}/bin' >> ~/.bashrc

# COPY solana-run.sh /usr/bin/solana-run.sh
# ENTRYPOINT [ "/usr/bin/solana-run.sh" ]

# there can be only one CMD instruction
CMD ["/bin/bash"]
# CMD ["tail", "-f", ""]
