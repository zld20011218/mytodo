FROM gitpod/workspace-full:latest

USER root

# Install custom tools, runtime, etc.
RUN apt update \
    && apt install -yq \
        apt-utils \
        build-essential \
        htop \
        less \
        locales \
        man-db \
        software-properties-common \
        zsh \
        git \
        git-extras \
        vim \
        netcat \
        tldr \
        nmap \
    && locale-gen en_US.UTF-8 \
    && apt autoremove \
    && apt autoclean \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*
ENV LANG=en_US.UTF-8

USER gitpod

# Install Oh-My-Zsh
RUN sudo echo "Running 'sudo' for Gitpod: success"

### Oh My Zsh ###
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY zsh/nox.zsh-theme /home/gitpod/.oh-my-zsh/themes/

### checks ###
# no root-owned files in the home directory
RUN notOwnedFile=$(find . -not "(" -user gitpod -and -group gitpod ")" -print -quit) \
   && { [ -z "$notOwnedFile" ] \
      || { echo "Error: not all files/dirs in $HOME are owned by 'gitpod' user & group"; exit 1; } }

RUN tldr --update

# start zsh
CMD ["zsh", "-i"]
