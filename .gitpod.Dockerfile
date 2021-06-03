FROM gitpod/workspace-full:latest

USER root

# Install custom tools, runtime, etc.
RUN ["apt-get", "update"]

RUN ["apt-get", "install", "-y", "zsh"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "netcat"]
RUN ["apt-get", "install", "-y", "nmap"]
RUN ["apt-get", "install", "-y", "tldr"]

USER gitpod

# set the zsh theme
ENV ZSH_THEME cloud

# Install Oh-My-Zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# start zsh
CMD [ "zsh" ]
