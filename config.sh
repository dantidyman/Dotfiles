#! /bin/zsh

#llet's start this off right by changing the shell for the current user
chsh -s /bin/zsh

# We do need to install brew for some of this to work

echo
echo Installing XCode Command Line Tools...
xcode-select --install | echo

echo
echo Done.
echo
echo Installing Brew...

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 
echo Done.
echo Brewing up packages from Brewfile...
echo

#switch to the brew folder and begin to install files and their dependencies
cd ~/Dotfiles/brew/
brew bundle install -v

echo Beginning installation of pure prompt...
npm install --global pure-prompt

echo
echo Done.
echo

echo Moving .vim &  .vimrc into place...
cp -vr ~/Dotfiles/vim/ ~/.vim/
cp -v  ~/Dotfiles/vim/.vimrc ~/

echo
echo Done. 
echo

echo Moving .zshrc into place...
cp ~/Dotfiles/zsh/.zshrc ~/.zshrc

echo
echo Done.
echo

echo Moving chunkwm and skhd config files into place...
cp -v  ~/Dotfiles/chunkwm/.chunkwmrc ~/
cp -v  ~/Dotfiles/chunkwm/.skhdrc ~/

echo
echo Starting up chunkwm...
brew services start chunkwm

echo Starting up skhd
brew services start skhd

echo
echo Moving brew-upgrade script into place
cp -v  ~/Dotfiles/brew/brew-upgrade.sh ~/

echo
echo Moving and installing crontab...
sudo crontab -u $USER ~/Dotfiles/Shell\ Tweaks/personal_crontab

echo Basic installation done. You must add the sudoers file manually via visudo. You can find the sudoers lecture file at ~/Dotfiles/Shell Tweaks/sudoers.lecture.
