FROM python:3.8 
 
ARG WORKSPACE=/root 

RUN apt update && apt upgrade -y

Run apt install nodejs wget build-essential zsh  -y 
Run apt-get install latexmk 

RUN git clone https://github.com/vim/vim.git && cd vim/src && ./configure &&  make && make install && \ 
	git config --global user.name "John Doe" && \
	git config --global user.email johndoe@example.com

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
 
WORKDIR $WORKSPACE

COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

CMD ["zsh"]
