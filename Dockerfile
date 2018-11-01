FROM ubuntu:18.04

# trigger image build: 2018-11-02

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    wget -O /tmp/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb" && \
    (dpkg -i /tmp/dropbox.deb || apt-get install -fy) && \
    rm /tmp/dropbox.deb && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/dropboxd.tar.gz "https://www.dropbox.com/download/?plat=lnx.x86_64" && \
    tar -xf /tmp/dropboxd.tar.gz -C $HOME && \
    chown -R root:root $HOME/.dropbox-dist && \
    rm /tmp/dropboxd.tar.gz

ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]
