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
apt-get purge -y texlive-pictures-doc texlive-pstricks-doc libgl1-mesa-dri \
texlive-latex-base-doc texlive-base texlive-latex-recommended-doc libllvm3.8 \
texlive-binaries texlive-pstricks lmodern libicu55 texlive-latex-recommended \
gcc-5 git g++-5 cpp-5 libperl5.22 tex-gyre texlive-fonts-recommended && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* $HOME/src
