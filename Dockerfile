FROM ubuntu

MAINTAINER normal normalnormalnnn@icloud.com

RUN apt-get update && apt upgrade && apt-get install -y --no-install-recommends iputils-ping net-tools iptables iproute2 \
	vim zsh git wget bash apt-utils python autojump bat ca-certificates && \
	chsh -s /usr/bin/zsh root && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh ; \
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

SHELL ["/bin/zsh", "-c"]

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ; \
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
	sed -i "s/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc ; \
	source ~/.zshrc && rm -rf /var/lib/apt/lists/* 

CMD zsh
