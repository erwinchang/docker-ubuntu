FROM ubuntu:trusty-20170602

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y make \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y sqlite3 libsqlite3-dev \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/workspace

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
