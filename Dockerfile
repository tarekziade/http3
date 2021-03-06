FROM ubuntu:bionic

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

RUN apt-get -y update
RUN apt-get install -y python3-pip python3-venv libssl-dev dumb-init


RUN useradd -m docker && \
    usermod -aG sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/docker/ && \
    mkdir /home/docker/data && \
    chown -R --from=root docker /home/docker

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /home/docker/data
ENV HOME /home/docker
ENV USER docker
USER docker
RUN python3 -m venv /home/docker/data

RUN touch $HOME/.sudo_as_admin_successful

COPY setup.py /home/docker/data/
COPY setup.cfg /home/docker/data/
COPY mozhttp3server /home/docker/data/mozhttp3server

RUN bin/python setup.py develop

COPY docker-entrypoint.sh /home/docker/data
ENTRYPOINT ["dumb-init", "/home/docker/data/docker-entrypoint.sh"]
CMD [ "server" ]
