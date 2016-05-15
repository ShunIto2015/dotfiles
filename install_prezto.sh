#!/bin/sh
echo "Now Install prezto"
echo "Check OS"
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  echo "OK,Your OS is $OS"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  echo "OK,Your OS is $OS"
  Distori=`tr -d ' ' < /etc/issue | tr -d ')' | tr -d '('  `
  if [ "$(eval expr substr $Distori 1 4)" == 'Arch' ]; then
    echo "OK,Your Distoribution is Arch Linux"
  elif [ "$(eval expr substr $Distori 1 6)" == 'Ubuntu' ]; then
    echo "OK,Your Distoribution is Ubuntu Linux"
  elif [ "$(eval expr substr $Distori 1 6)" == 'CentOS' ]; then
    echo "OK,Your Distoribution is CentOS Linux"
  elif [ "$(eval expr substr $Distori 1 6)" == 'Fedora' ]; then
    echo "OK,Your Distoribution is Fedora Linux"
  elif [ "$(eval expr substr $Distori 1 6)" == 'Debian' ]; then
    echo "OK,Your Distoribution is Debian Linux"
  else
    echo "Sorry,Your Distoribution is not supported."
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
  echo "OK,Your OS is $OS"
else
  echo "Sorry,Your platform $(uname -a) is not supported."
  exit 1
fi
