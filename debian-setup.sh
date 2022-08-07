#!/bin/bash

EMAIL="lifehere23@gmail.com"
USER_NAME="lito"

#Stages
SETTINGS="settings"
BRAVE="brave"
VSCODE="vscode"
GIT="git"
GITHUB_CLI="github-cli"

CURRENT_STAGE=$(head -n 1 stage.txt)

case $CURRENT_STAGE in

$GIT)
  git config --global user.email "$EMAIL"
  git config --global user.name "$USER_NAME"
  ;;

$GITHUB_CLI)
  echo "CLI"
  ;;

$SETTINGS)
  echo "Settings stage"
  # clone my dotfiles
  cd ~/Projects
  git clone https://github.com/kornatskyi/mySettings.git
  cp -r mySettings/fonts ~/.fonts
  ;;

$BRAVE)
  echo "Brave stage"
  ### Brave Browser ###
  # install brave browser
  sudo apt install apt-transport-https curl
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update
  sudo apt install brave-browser

  # After Brave is install go and sync it with an old instance of Brave
  ;;

$VSCODE)
  echo "VSCODE stage"
  ### VScode ###
  # install vscode
  echo "Start installing VScode"

  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code
  ;;

*)
  echo "Custom stage"
  ;;

esac

# if [ $? == "0" ]; thenhkk
#     echo "VS code has been installed sucsesfully"
# else
#     echo "Error "
# fih
# echo "Hello"
# exit 1

# Optional
# KDE Plasma windows layot setup
# install `krohnkit` which is behive simmilarly to dwm
# https://github.com/esjeon/krohnkite
