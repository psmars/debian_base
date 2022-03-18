# debian_base

A rather small personalised docker image based on Debian.

## Added utilities

- zsh 
- zsh-syntax-highlighting 
- less 
- usbutils 
- cpuinfo 
- htop 
- sudo 
- neovim 
- git 
- wget 
- make 
- mc 
- manpages 
- man-db 
- openssh-client 
- screen 
- dos2unix 
- rlwrap

## Personalisation

- vim
- screen
- zsh

## Running

Example:

docker run --rm -it --hostname debian_base -v <your_directory>:/root absps/debian_base
