#!/bin/bash

# Matt Revell Scripts v1.1

homebrew_packages=(
  "git"
  "tmux"
  "vim"
  "neovim"
  "reattach-to-user-namespace"
)

homebrew_cask_apps=(
  "google-chrome"
  "docker"
)

function installHomebrew() {
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function installBrewCask() {
  echo "Installing brew Cask"
  /usr/local/bin/brew tap caskroom/cask
}

function makeBashDefaultShell() {
  echo "Making bash the default shell"
  chsh -s /bin/bash
}

function makeScreenshotsSaveToDownloads() {
  echo "Configuring screenshots to save in Downloads"
  defaults write com.apple.screencapture location ~/Downloads
  killall SystemUIServer
}

function makeKeyboardRepeatRateFast() {
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 10
}

function installApps() {
  installHomebrewApps
  installHomebrewCaskApps
  installMacAppStoreApps
}

function installHomebrewApps() {
  echo "Installing Homebrew packages"
  for homebrew_package in "${homebrew_packages[@]}"; do
    brew install "$homebrew_package"
  done
}

function installHomebrewCaskApps() {
 echo "Installing Homebrew cask apps"
  for homebrew_cask_app in "${homebrew_cask_apps[@]}"; do
    brew cask install "$homebrew_cask_app"
  done
}

function installMacAppStoreApps() {
  echo "Installing Mac App Store apps"
  for mac_app_store_app in "${mac_app_store_apps[@]}"; do
    mas install "$mac_app_store_app"
  done
}

function manualInstalls() {
  installNvm
  installYarn
}

function installNvm() {
  echo "Installing nvm"
  rm -rf ~/.nvm
  mkdir ~/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
}

function installYarn() {
  echo "Intalling yarn"
  curl -o- -L https://yarnpkg.com/install.sh | bash
}

function symlinkingDotFiles() {
  echo "Symlinking dotfiles"
  for file in $(find "$HOME/Developer/environment/dotfiles" -depth 1 -exec basename {} \;); do
    ln -s "$HOME/Developer/environment/dotfiles/$file" "$HOME/$file"
  done
}

function fixSierraSSHKeys() {
  cat > ~/.ssh/config << EOL
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EOL

}

function activate() {
  installHomebrew
  installBrewCask
  makeBashDefaultShell
  makeScreenshotsSaveToDownloads
  makeKeyboardRepeatRateFast
  installApps
  manualInstalls
  symlinkingDotFiles
  fixSierraSSHKeys
}

activate

echo "Done"
