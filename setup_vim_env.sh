#!/bin/bash

if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.backup
fi

cp ./vimrc ~/.vimrc

if [ -d ~/.vim ]; then
    cp -r ~/.vim ~/.vim_backup
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
wget -O ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

git clone git@github.com:tomtom/tcomment_vim.git ~/.vim/bundle/tcomment_vim
git clone git@github.com:nvie/vim-flake8.git ~/.vim/bundle/vim-flake8
git clone git@github.com:tpope/vim-fugitive ~/.vim/bundle/vim-fugitive
git clone git@github.com:airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
git clone git@github.com:davidhalter/jedi.git ~/.vim/bundle/jedi
cd ~/.vim/bundle/jedi ; sudo python ./setup.py install ; cd -
git clone git@github.com:davidhalter/jedi-vim ~/.vim/bundle/jedi-vim

