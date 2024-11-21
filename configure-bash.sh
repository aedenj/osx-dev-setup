export OSH="$HOME/.osxdevsetup/oh-my-bash"; bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

ln -sf $OSXDEVSETUP_HOME/bash/bashrc  ~/.bashrc
ln -sf $OSXDEVSETUP_HOME/bash/bash_profile ~/.bash_profile
ln -sf $OSXDEVSETUP_HOME/bash/gitconfig ~/.gitconfig

mkdir ~/.bash
ln -sf $OSXDEVSETUP_HOME/bash/bashrc_ext ~/.bash/bashrc_ext
ln -sf $OSXDEVSETUP_HOME/bash/apps/aliases ~/.bash/aliases
ln -sf $OSXDEVSETUP_HOME/bash/apps/brew ~/.bash/brew
ln -sf $OSXDEVSETUP_HOME/bash/apps/coreutils ~/.bash/coreutils
ln -sf $OSXDEVSETUP_HOME/bash/apps/java ~/.bash/java
ln -sf $OSXDEVSETUP_HOME/bash/apps/nvm ~/.bash/nvm
ln -sf $OSXDEVSETUP_HOME/bash/apps/asdf ~/.bash/asdf
