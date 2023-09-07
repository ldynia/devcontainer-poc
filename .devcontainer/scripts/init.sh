#!/usr/bin/env bash

function install() {
  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc > /dev/null
  echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list

  npm install -g wscat

  sudo apt update && sudo apt install -y \
      bash-completion \
      git-core \
      ngrok
}

function configure() {
  source /usr/share/bash-completion/completions/git
  source /usr/share/bash-completion/completions/docker
}

# Execut function(s)
install
configure
