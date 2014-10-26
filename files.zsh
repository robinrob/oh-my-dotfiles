#!/usr/bin/env zsh

source colors.zsh

./symlinks.zsh

./jetbrains.zsh

green "Installing crontab ..."
crontab crontab.cron

green "Installing Robin's custom keyboard layout ..."
cp Robin.keylayout ~/Library/Keyboard\ Layouts/

green "Installing sudoers file ..."
# Make sure that the file has correct permissions first!
sudo chmod 440 sudoers
sudo chown root:wheel sudoers
sudo cp sudoers /etc/sudoers
sudo chmod 444 sudoers

# red "Removing folder: ~/.vim"
# rm -rf ~/.vim
