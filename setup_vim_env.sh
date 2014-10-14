# OBSOLETE !!!

#!/bin/bash

if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.backup
fi

cp ./vimrc ~/.vimrc

if [ -d ~/.vim ]; then
    cp -r ~/.vim ~/.vim_backup
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle
wget -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Molokai colorscheme
mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

# Comment handling
git clone git@github.com:tomtom/tcomment_vim.git ~/.vim/bundle/tcomment_vim

# PEP8 for Python
git clone git@github.com:nvie/vim-flake8.git ~/.vim/bundle/vim-flake8

# Git support
git clone git@github.com:tpope/vim-fugitive ~/.vim/bundle/vim-fugitive
git clone git@github.com:airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter

# Autocomplete for Python
git clone git@github.com:davidhalter/jedi.git ~/.vim/bundle/jedi
cd ~/.vim/bundle/jedi ; sudo python ./setup.py install ; cd -
git clone git@github.com:davidhalter/jedi-vim ~/.vim/bundle/jedi-vim

# Create tags automatically
sudo apt-get install exuberant-ctags
git clone git@github.com:xolox/vim-misc ~/.vim/bundle/vim-misc
git clone git@github.com:xolox/vim-easytags ~/.vim/bundle/vim-easytags
git clone git@github.com:majutsushi/tagbar.git ~/.vim/bundle/tagbar

# Supertab
git clone git@github.com:ervandew/supertab.git ~/.vim/bundle/supertab

