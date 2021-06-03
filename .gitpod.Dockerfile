FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc.

ARG DEBIAN_FRONTEND=noninteractive
RUN sudo apt -qq install zsh
RUN sudo apt -qq install git
RUN sudo apt -qq install netcat
RUN sudo apt -qq install nmap
RUN sudo apt -qq install vim
RUN sudo apt -qq install tldr
RUN sudo apt autoremove
RUN sudo apt autoclean

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
