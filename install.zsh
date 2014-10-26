#!/usr/bin/env zsh

source colors.zsh

green "Installing YADR ..."
./yadr.zsh
git submodule update --init --recursive

green "Configuring files ..."
./files.zsh

brightwhite "Done."
