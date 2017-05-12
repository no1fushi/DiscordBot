#!/bin/bash

count=`ps ax | grep ruby | grep -v grep | wc -l`
mailfile='/home/pi/script/tmp/mail.txt'

if [ $count = 0 ]; then
	echo "DiscordBot Down"
	nohup ruby /home/pi/script/discordbot.rb &
	echo "DiscordBot Start"
#mail
	hostname > $mailfile
	date "+%Y/%m/%d %H:%M:%S" >> $mailfile
	echo "DiscordBot Down" >> $mailfile
	mail -s "DiscordBotDown" "hoge@hoge.com" < "$mailfile"
else
	echo "DiscordBot OK"
fi

