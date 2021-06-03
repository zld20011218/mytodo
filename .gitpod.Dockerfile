FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc.

ARG DEBIAN_FRONTEND=noninteractive
RUN apt -qq install zsh
RUN apt -qq install git
RUN apt -qq install netcat
RUN apt -qq install nmap
RUN apt -qq install vim
RUN apt -qq install tldr
RUN apt autoremove
RUN apt autoclean

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
