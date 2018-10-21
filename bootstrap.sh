#!/bin/bash

# Setting global variables
REPO_NAME=ansible-nginx-webapp-deploy
REPO_SRC=https://github.com/andrey-khashchin/${REPO_NAME}.git
REPO_DST=/home/vagrant/${REPO_NAME}
ANSIBLE_HOSTS_NAME=hosts
ANSIBLE_HOSTS_FILE=${REPO_DST}/${ANSIBLE_HOSTS_NAME}
ANSIBLE_PLAYBOOK_NAME=${REPO_NAME}
ANSIBLE_PLAYBOOK_FILE=${REPO_DST}/${ANSIBLE_PLAYBOOK_NAME}.yml
ANSIBLE_TAGS=all

echo -e "************************\n"
echo -e "** BEGIN BOOTSTRAPING **\n"
echo -e "************************\n"

# Updating available packages list
echo -e "****************************\n"
echo -e "** UPDATING PACKAGES LIST **\n"
echo -e "****************************\n"
sudo apt-get update -y

# Installing updates for existing packages
echo -e "*********************************\n"
echo -e "** UPGRADING EXISTING PACKAGES **\n"
echo -e "*********************************\n"
sudo apt-get upgrade -y

# Add Ansible PPA 
echo -e "*********************\n"
echo -e "** ADD ANSIBLE PPA **\n"
echo -e "*********************\n"
sudo apt-add-repository -y ppa:ansible/ansible 

# Install Ansible
echo -e "*********************\n"
echo -e "** INSTALL ANSIBLE **\n"
echo -e "*********************\n"
sudo apt-get -y install ansible

if [ $? = 0 ]; then

  # Test whether Ansible installed
  echo -e "*******************************\n"
  echo -e "** TEST IF ANSIBLE INSTALLED **\n"
  echo -e "*******************************\n"
  ansible --version && ansible localhost -m ping

  # Clone github repo
  echo -e "*************************\n"
  echo -e "** CLONING GITHUB REPO **\n"
  echo -e "*************************\n"
  echo -e "Cloning from ${REPO_SRC}\n"
  git clone ${REPO_SRC} ${REPO_DST}

  if [ $? = 0 ]; then

    # Running ansible-playbook
    echo -e "***************************************\n"
    echo -e "** RUNNING ANSIBLE PLAYBOOK WITH TAGS**\n"
    echo -e "***************************************\n"
    ansible-playbook -i ${ANSIBLE_HOSTS_FILE} ${ANSIBLE_PLAYBOOK_FILE} --tags ${ANSIBLE_TAGS}

  else
     echo -e "*********************************\n"
     echo -e "** CLONING GITHUB REPO FAILED! **\n"
     echo -e "*********************************\n"
     exit 1
fi

else
  echo -e "**********************************\n"
  echo -e "** ANSIBLE INSTALLATION FAILED! **\n"
  echo -e "**********************************\n"
  exit 1
fi

# END BOOTSTRAPING 
echo -e "**********************\n" 
echo -e "** END BOOTSTRAPING **\n" 
echo -e "**********************\n"

