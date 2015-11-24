#!/bin/sh

echo "Start rbenv install!"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo "finish rbenv install"
echo "Start ruby-build install"
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo "finish ruby-build install"
