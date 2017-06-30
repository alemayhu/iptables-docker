FROM ubuntu

LABEL x="2"

ENV IPTABLES_INSTALLER /tmp/Scripts/nft-dev

RUN apt-get update && \
apt-get install -y git sudo && \
git clone https://github.com/scanf/Scripts /tmp/Scripts && \
$IPTABLES_INSTALLER prepare && \
$IPTABLES_INSTALLER  && \
$IPTABLES_INSTALLER  && \
git -C $HOME/src/netfilter.org/iptables describe > /etc/IPTABLES_VERSION && \
make -C $HOME/src/netfilter.org/*/ clean && \
$IPTABLES_INSTALLER prepare purge && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* $HOME/src
