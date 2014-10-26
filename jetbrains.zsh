#!/usr/bin/env zsh

source colors.zsh
source indents.zsh
source functions.zsh

function install() {
	yellow "\t${ITEM}Installing $1 config ..."
	cp $2 $2.backup 2> /dev/null
	rm -f $2
	ln Robin.xml $2
}

green "Installing Jetbrains IDE config files ..."

install IntelliJIdea $INTELLIJ_CONFIG

# install RubyMine $RUBYMINE_CONFIG
#
# install PyCharm $PYCHARM_CONFIG
#
# install WebStorm $WEBSTORM_CONFIG
