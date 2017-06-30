FROM ubuntu

LABEL x="2"

ENV IPTABLES_INSTALLER /tmp/Scripts/nft-dev

RUN apt-get update && \
apt-get install -y git sudo && \
git clone https://github.com/scanf/Scripts /tmp/Scripts && \
$IPTABLES_INSTALLER prepare && \
$IPTABLES_INSTALLER  && \
$IPTABLES_INSTALLER  && \
$IPTABLES_INSTALLER prepare purge && \
make -C $HOME/src/netfilter.org/*/ clean && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* $HOME/src
