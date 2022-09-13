FROM debian:stable-slim 
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.12" \
      tw.edu.yuntech.smars.release-date="2022-03-18"
RUN echo 'path-include /usr/share/man/man*' >> /etc/dpkg/dpkg.cfg.d/docker && \
	sed -i 's,path-exclude.*groff,#erased line (absps points_forces),g' /etc/dpkg/dpkg.cfg.d/docker
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y \
	apt-utils \
	zsh \
	zsh-syntax-highlighting \
	less \
	usbutils \
	cpuinfo \
	procps \
	htop \
	iputils-ping \
	sudo \
	neovim \
	git \
	wget \
	make \
	mc \
	manpages \
	man-db \
	openssh-client \
	screen \
	dos2unix \
	rlwrap
RUN apt-get install --reinstall \ 
	coreutils \
	mawk \
	sed
COPY config /usr/share/absps/config

ENV EDITOR="/usr/bin/nvim"
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN find /root -type f -exec chmod 0640 {} \; && \
	chmod 0700 /usr/share/absps/config/install 
WORKDIR /root
CMD /usr/share/absps/config/install && \
	/bin/zsh
