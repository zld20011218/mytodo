FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc.
RUN brew install perl
RUN brew install zsh
RUN brew install git
RUN brew install netcat
RUN brew install nmap
RUN brew install vim
RUN brew install tldr
RUN brew cleanup

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
