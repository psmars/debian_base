FROM debian:stable-slim 
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.9" \
      tw.edu.yuntech.smars.release-date="2020-01-19"
RUN echo 'path-include /usr/share/man/man*' >> /etc/dpkg/dpkg.cfg.d/docker && \
	sed -i 's,path-exclude.*groff,#erased line (absps points_forces),g' /etc/dpkg/dpkg.cfg.d/docker
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y \
	zsh \
	zsh-syntax-highlighting \
	less \
	usbutils \
	cpuinfo \
	htop \
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
RUN find /root -type f -exec chmod 0640 {} \; && \
	chmod 0700 /usr/share/absps/config/install 
WORKDIR /root
CMD /usr/share/absps/config/install && \
	/bin/zsh
