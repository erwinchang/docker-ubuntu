FROM ubuntu:trusty-20170626

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y make \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y sqlite3 libsqlite3-dev \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y cmake lua5.2 \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y git \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny \
 && rm -rf /var/lib/apt/lists/*

# Add uci files.
ADD tools/libubox/libubox /usr/local/include
ADD tools/libubox/libubox.so /usr/local/lib
RUN ldconfig

ADD tools/uci/uci /usr/local/include
ADD tools/uci/libuci.so /usr/local/lib
ADD tools/uci/bin/uci /usr/local/bin
RUN ldconfig

RUN mkdir /usr/local/include/uci

# Add root files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts 

# Set mount floder
RUN mkdir /root/workspace

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
