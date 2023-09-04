export OSH="$HOME/.osxdevsetup/oh-my-bash"; bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

ln -s $OSXDEVSETUP_HOME/bash/gitconfig ~/.gitconfig

mkdir ~/.bash
ln -s $OSXDEVSETUP_HOME/bash/bashrc_ext ~/.bash/bashrc_ext
ln -s $OSXDEVSETUP_HOME/bash/apps/aliases ~/.bash/aliases
ln -s $OSXDEVSETUP_HOME/bash/apps/brew ~/.bash/brew
ln -s $OSXDEVSETUP_HOME/bash/apps/coreutils ~/.bash/coreutils
ln -s $OSXDEVSETUP_HOME/bash/apps/java ~/.bash/java

echo '' >> ~/.bashrc
echo 'source ~/.bashrc_ext' >> ~/.bashrc
