#!/usr/bin/env bash

set -e
set -x

WORKSPACE=${WORKSPACE:=~/src/personal}
ZSH_CUSTOM=${ZSH_CUSTOM:=~/.oh-my-zsh/custom}

function fetch_repo {
  mkdir -p ${WORKSPACE}
  cd ${WORKSPACE}
  git clone https://github.com/emissionnebula/dotfiles.git
}

function initial_setup_macos {
  # install xcode
  xcode-select --install

  ## Install mac specific packages ##

  # install homebrew - see https://brew.sh/ for more info
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  
  brew cask install iterm2

}

function initial_setup {
  if [ "$(uname)" == "Darwin" ]; then
    initial_setup_macos
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    initial_setup_ubuntu
  fi
}

function install_pkg {
  if [ "$(uname)" == "Darwin" ]; then
    brew install $1
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install $1
  fi
}

function setup_java {
  if [ "$(uname)" == "Darwin" ]; then
    # Installs OpenJDK 8
    brew tap AdoptOpenJDK/openjdk
    brew cask install adoptopenjdk8
    brew cask install adoptopenjdk11

    # To install the latest JDK
    brew cask install adoptopenjdk
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install openjdk
  fi

  install_pkg jenv

  # use jenv to manage JAVA_HOME as well
  jenv enable-plugin export

  # add the JDKs installed above
  jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
  jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
  jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-14.jdk/Contents/Home
  # select a default for global usage
  jenv global 1.8
}

function setup_goenv {
  git clone https://github.com/syndbg/goenv.git ~/.goenv
  goenv install 1.12.7
  goenv install 1.13.10
  goenv install 1.14.2
  goenv global 1.14.2
}
  
function setup_zsh {
  # Fix insecure file issue
  sudo chmod -R 755 /usr/local/share/zsh
  
  # install oh-my-zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # install plugins
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions\
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting\
  git clone git://github.com/gradle/gradle-completion ${ZSH_CUSTOM}/plugins/gradle-completion
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM}/plugins/fzf-tab


  # install powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

  # install Heck Fonts
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font

  mv ~/.zshrc ~/.zshrc.oh-my-zsh
  ln -s ${WORKSPACE}/dotfiles/zshrc/zshrc ~/.zshrc
  ln -s ${WORKSPACE}/dotfiles/zshrc/custom/confluent.zsh ~/.oh-my-zsh/custom/confluent.zsh
  ln -s ${WORKSPACE}/dotfiles/zshrc/custom/development_env.zsh ~/.oh-my-zsh/custom/development_env.zsh
}

function setup_vim {
  install_pkg vim

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  ln -s ${WORKSPACE}/dotfiles/vimrc/vimrc ~/.vimrc
  ln -s ${WORKSPACE}/dotfiles/vimrc/vimrc.plug ~/.vimrc.plug
  vim +PlugInstall +qall

  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
}

function install_fzf {
  install_pkg fzf
  $(brew --prefix)/opt/fzf/install

  if [ -f ~/.fzf.zsh ]; then
    mv ~/.fzf.zsh ~/.oh-my-zsh/custom/
  fi
  
  if [ -f ~/.fzf.bash ]; then
    rm ~/.fzf.bash
  fi
}

function set_paths {
  echo 'export PATH=$PATH:'"$WORKSPACE"'/dotfiles/cmds' >  ${ZSH_CUSTOM}/fuzzy_cmds.zsh
}
<< T
fetch_repo
initial_setup

setup_java
setup_goenv
install_pkg maven
install_pkg gradle
install_pkg python3

# Setup Shell
install_pkg zsh
install_pkg zsh-completions
setup_zsh

setup_vim

install_fzf
install_pkg ripgrep
T
set_paths
