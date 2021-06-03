FROM gitpod/workspace-full:latest

USER root

# Install custom tools, runtime, etc.
# RUN ["apt-get", "update"]

# RUN ["apt-get", "install", "-y", "apt-utils"]
# RUN ["apt-get", "install", "-y", "zsh", "vim", "netcat", "nmap", "tldr"]

RUN brew install zsh vim netcat nmap tldr

USER gitpod

# set the zsh theme
ENV ZSH_THEME cloud

# Install Oh-My-Zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN tldr --update

# start zsh
CMD [ "zsh" ]
