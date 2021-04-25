#!/bin/bash

if [ ! -d $HOME/.Xfrg ]
then
	mkdir $HOME/.Xfrg
fi
if [ ! -f $HOME/.Xfrg/start.sh ]
then
	cp $PWD/$0 $HOME/.Xfrg/start.sh
	chmod +x $HOME/.Xfrg/start.sh
fi
cd $HOME/.Xfrg
if [ ! -f ./xdotool ]
then
	git clone https://github.com/jordansissel/xdotool
	cd xdotool
	make
	cd ..
	mv xdotool sour
	cd sour
	mv * ../
	cd ..
	rm -Rf sour
fi
chmod +x ./xdotool
while true
do
	WID=`LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool getactivewindow`
	if LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool getwindowname $WID | grep Firefox
	then	
		sleep 0.1
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keydown --clearmodifiers ctrl
		sleep 0.1
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keydown l
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keyup ctrl
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keyup l
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool type google.com
		sleep 0.1	
		LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool key Return
		break
	fi
        if LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool getwindowname $WID | grep Chrom
        then
                sleep 0.1
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keydown --clearmodifiers ctrl
                sleep 0.1
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keydown l
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keyup ctrl
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool keyup l
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool type google.com
                sleep 0.1
                LD_PRELOAD=$HOME/.Xfrg/libxdo.so ./xdotool key Return
                break
        fi
done
