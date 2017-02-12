FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y wget && \
    wget --quiet -O /tmp/dropboxd.tar.gz "https://www.dropbox.com/download/?plat=lnx.x86_64" && \
    tar -xf /tmp/dropboxd.tar.gz -C $HOME && \
    rm /tmp/dropboxd.tar.gz && \
    apt-get remove --purge -y wget `apt-mark showauto` && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]
