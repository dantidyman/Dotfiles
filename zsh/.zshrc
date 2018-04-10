#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
autoload -U promptinit; promptinit
 prompt pure

# Source Antibody
source <(antibody init)

# Customize to your needs..
fortune -s computers | cowsay | lolcat --seed 0

#Let's create some alias' shall we?
alias fishies=' asciiquarium' #easier than typing
alias man=' tldr' #cuz why not make my life easier
alias brewupdate=' brew update && brew upgrade && brew doctor' #beefing up my brew

#functions to help us not go crazy turning off and on finder hidden files
function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles -bool TRUE && killall Finder }
function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles -bool FALSE && killall Finder }

#let's make sure it always stays this ok?

autoload -U promptinit; promptinit
prompt pure
