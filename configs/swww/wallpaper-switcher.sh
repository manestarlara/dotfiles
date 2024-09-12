#!/bin/bash

## Files
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

DIR=$HOME/Downloads/
PICS=($(ls ${DIR}))

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt 'choose..'
			--conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
			--width=300 --height=400 \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--define=matching=fuzzy"


			
menu (){
printf "1. ascii\n"
printf "2. cat\n"
printf "3. web\n"
}

swww query || sww-daemon

main() {
	choice=$(menu | ${wofi_command} | cut -d. -f1)
	case $choice in
		1)
			swww img ${DIR}/ascii.png --transition-fps 60 --transition-type wipe --transition-angle 45 --transition-duration 3
			return
			;;
		2)
			swww img ${DIR}/cat.jpg --transition-fps 60 --transition-type wipe --transition-angle 45 --transition-duration 3
			return
			;;
		3)
			swww img ${DIR}/web.jpg --transition-fps 60 --transition-type wipe --transition-angle 45 --transition-duration 3 
			return
			;;
	esac
}

killall swww || main
