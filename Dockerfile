FROM debian:stable-slim
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.0" \
      tw.edu.yuntech.smars.release-date="2020-01-15"
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
	
COPY .zshrc \
	.screenrc \
	.alias \
	/root/
COPY .config /root/.config

ENV EDITOR="/usr/bin/nvim"
RUN find /root -type f -exec chmod 0640 {} \;
WORKDIR /root
CMD /bin/zsh
