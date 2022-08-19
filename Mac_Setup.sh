#!/usr/bin/env bash

# Setup script for setting up a new macos machine
echo "Starting setup"

# Install xcode CLI
xcode-select —-install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
#blah blah blah

#whatever goes here

# Homebrew packages
PACKAGES=(
    git
    aws-cli
    htop
    background-music
)
echo "Installing packages..."
brew install ${PACKAGES[@]}
# any additional steps you want to add here


#another comment here
echo "Cleaning up..."
brew cleanup

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)
sudo pip install ${PYTHON_PACKAGES[@]}

# ruby install
ruby-install ruby 2.5.5
echo "Installing Ruby gems"
RUBY_GEMS=(
    bundler
    byebug
    json
    middleman
    middleman-cli
    rake
    rspec
)
sudo gem install ${RUBY_GEMS[@]}

echo "Installing cask..."
CASKS=(
    iterm2
    spotify
    intellij-idea-ce
    visual-studio-code
)
echo "Installing cask apps..."
brew cask install ${CASKS[@]}

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Macbook setup completed!"
