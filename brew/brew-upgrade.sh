#! /bin/zsh

echo "\nHEY IF YOU'RE SEEING THIS I'M UPGRADING BREW\n \nSincerely,\n \nYour Laptop <3"

# Let's get today's date using the %F format
DATE=$(/bin/date +'%F')

# We need to get yesterday's date too
YESTERDAY=$(date -v-1d +'%F')

#set today's log file for Brew
FILE="/tmp/brew_$DATE.log"

#Check to see if there's an old log, and move it to a folder to store old logs
if [ -e /tmp/brew_$YESTERDAY.log ]; then
	
	#does the folder not exist? bummer. let's make it exist.
	if [ ! -d /tmp/Old_Brew/ ]; then
		mkdir /tmp/Old_Brew/
	fi

	mv /tmp/brew_$YESTERDAY.log /tmp/Old_Brew/
fi

# group the commands together for easier export
{
/bin/date +'%F - %r'

echo

/usr/local/bin/brew update

echo

/usr/local/bin/brew upgrade
} > $FILE

/usr/bin/osascript -e 'display notification "Brew has been upgraded. Check log file for errors." with title "Cron - Brew"'

sleep 5
