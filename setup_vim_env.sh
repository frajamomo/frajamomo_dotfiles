#!/bin/bash

if [-f $HOME/.vimrc ]
then
    cp $HOME/.vimrc $HOME/.vimrc.backup
fi

cp vimrc $HOME/.vimrc
