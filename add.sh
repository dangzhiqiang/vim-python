#!/bin/bash
set -x
set -e

VERSION=$(vim --version |grep "Vi IMproved" |awk '{print $5}')
VIM_DIR="/usr/share/vim/vim${VERSION//./}"

unzip pydiction-1.2.3.zip
\cp -vf pydiction/after/ftplugin/python_pydiction.vim $VIM_DIR/ftplugin/
mkdir -p $VIM_DIR/pydiction
\cp -vf pydiction/complete-dict $VIM_DIR/pydiction
\cp -vf pydiction/pydiction.py  $VIM_DIR/pydiction

echo -e "\n\" Add python file support" >>/etc/vimrc
echo "let g:pydiction_location='$VIM_DIR/pydiction/complete-dict'" >> /etc/vimrc

echo "autocmd FileType python setlocal autoindent smartindent expandtab tabstop=4 shiftwidth=4 softtabstop=4" >> /etc/vimrc

rm -rvf pydiction
