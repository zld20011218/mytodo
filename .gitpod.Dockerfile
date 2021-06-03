FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc.
RUN sudo brew zsh git netcat nmap vim

# set the zsh theme 
ENV ZSH_THEME cloud

#install NG CLI
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh