FROM gitpod/workspace-full

USER root

# Install custom tools, runtime, etc.

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y zsh git netcat nmap vim tldr && apt autoremove -y && apt autoclean -y

USER gitpod

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
