FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc.
RUN brew install perl zsh git netcat nmap vim tldr

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN tldr git
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
