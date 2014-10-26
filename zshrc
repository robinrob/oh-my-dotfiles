#!/usr/bin/env zsh -x

DOTFILES_HOME=~/Programming/robin/zsh/projects/dotfiles
source $DOTFILES_HOME/colors.zsh

echo "$(brightwhite)I $(brightyellow)am $(brightcyan awesome)"
# Or alternatively:
# echo "$(brightwhite I)$(brightyellow " am ")$(brightcyan awesome)"


# YADR stuff
############
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file


# Environment variables
#############################
source $DOTFILES_HOME/env_variables.zsh


# Functions
###############################################################################

source $DOTFILES_HOME/functions.zsh


# Aliases
###############################################################################
source $DOTFILES_HOME/aliases.zsh


# ZSH Shell configuration
# autoload -Uz promptinit
# promptinit
prompt robin

unsetopt correct
# setopt prompt_subst
setopt autocd
set -o vi



# echo `eval "echo \`echo "$(white I)$(yellow " am ")$(cyan awesome)"\`"`

# First-time stuff!
###############################################################################

# rvm get 1.21.15

# ln $SH_HOME/rubyapp /usr/local/bin/rubyapp

# gem install chef knife-windows knife-ec2 --no-ri --no-rdoc


# Fixes!
###############################################################################

# gem tool errors
#################
# brew unlink libyaml && brew link libyaml
# brew unlink openssl && brew link --force openssl


# ZSH setup
###############################################################################



# Path
######
PATH=$PATH:$EC2_HOME/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$LOCAL_HOME/bin
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin/
PATH=$PATH:/usr/local/Library/cocos2d-console/bin


# OS-Specific stuff
###############################################################################

# OS X
######
defaults write com.apple.Safari AlwaysShowTabBar -bool NO

defaults write com.apple.Finder AppleShowAllFiles NO 2> /dev/null

# http://www.tekrevue.com/tip/how-to-customize-screenshot-options-in-mac-os-x/
# killall SystemUIServer
defaults write com.apple.screencapture location $SCREENSHOTS_HOME 2> /dev/null
defaults write com.apple.screencapture name $HOSTNAME
# defaults write com.apple.screencapture type png

defaults write -g ApplePersistence -bool no 2> /dev/null
chflags nohidden ~/Library/ 2> /dev/null

# Speed at which Dock auto-hides
# defaults write com.apple.dock autohide-time-modifier -float 0.0


# Ubuntu
########

# OPAM configuration
. /Users/msl/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# Development
###############################################################################


# Python
########
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

if [[ "$HOSTNAME" == "$VENUS_HOSTNAME" ]]
then
	pythonbrew use 2.7 2> /dev/null
else
	pythonbrew use 2.7 2> /dev/null
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# To do:
# Manage zsh history - sync between computers! Manage size.

# Ruby
######
# `rvm reset` is the magic secret command that fixes the path errors!!
ruby="2.1.1"
rvm use ruby-"$ruby"
