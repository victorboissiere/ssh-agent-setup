#!/usr/bin/env bash

SCRIPT_URL='https://raw.githubusercontent.com/victorboissiere/ssh-agent-setup/master/ssh-find-agent.sh'
SCRIPT_NAME=ssh-find-agent.sh
SCRIPT_FOLDER=~/.ssh

red=`tput setaf 1`
green=`tput setaf 2`
orange=`tput setaf 3`
reset=`tput sgr0`

printInfo()
{
  echo "${1}${2}${reset}"
}

for RCFILE in ~/.bashrc ~/.zshrc
do
  if [ -w $RCFILE ]; then
    echo "Setting up ssh-agent process persistence for $RCFILE..."

    SCRIPT_PATH="$SCRIPT_FOLDER/$SCRIPT_NAME"
    if [ ! -f $SCRIPT_PATH ]; then
      echo "Downloading script..."
      mkdir -p $FOLDER
      wget -O $SCRIPT_PATH $SCRIPT_URL
    fi

    if [ `grep -c $SCRIPT_PATH $RCFILE` -eq 0 ]; then
      echo ". $SCRIPT_PATH" >> $RCFILE
      echo 'ssh-find-agent -a || eval $(ssh-agent) > /dev/null' >> $RCFILE
      echo -e "\n${green}Done! Please run 'source $RCFILE'${reset}\n"
    else
      printInfo $red 'Not applying config. File already sourced'
    fi
  else
    printInfo $orange "Ignoring file $RCFILE"
  fi
done

