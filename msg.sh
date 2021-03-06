#!/usr/bin/env bash

cd $HOME/msg

install() {
		sudo apt-get update
		sudo apt-get upgrade
sudo apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
sudo luarocks install oauth 
sudo luarocks install redis-lua 
sudo luarocks install lua-cjson 
sudo luarocks install ansicolors 
sudo luarocks install serpent 
}
   printf "\n\t"


red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	print_logo
	beyondteam
	logo_play
	install
elif [ "$1" = "update" ]; then
	logo_play
	beyondteam
	update
	exit 1
else
	print_logo
	beyondteam
	logo_play
	green "Beyond Messenger Bot running..."
	#sudo service redis-server restart
	lua ./bot/bot.lua
fi
