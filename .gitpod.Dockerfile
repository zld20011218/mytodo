FROM gitpod/workspace-full:latest

USER root

# Install custom tools, runtime, etc.
RUN apt-get update &&
    apt-get install -yq \
        apt-utils \
        neovim \
        asciidoctor \
        build-essential \
        htop \
        jq \
        less \
        locales \
        man-db \
        nano \
        software-properties-common \
        sudo \
        multitail \
        zsh \
        git \
        git-extras &&
    locale-gen en_US.UTF-8 &&
    apt-get clean &&
    rm -rf /var/cache/apt/* &&
    rm -rf /var/lib/apt/lists/* &&
    rm -rf /tmp/*
ENV LANG=en_US.UTF-8


USER gitpod

# set the zsh theme
ENV ZSH_THEME cloud

# Install Oh-My-Zsh
RUN sudo echo "Running 'sudo' for Gitpod: success"

### Oh My Zsh ###
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY zsh/nox.zsh-theme /home/gitpod/.oh-my-zsh/themes/

RUN tldr --update

# start zsh
CMD ["zsh", "-i"]
