#!/usr/bin/env bash

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.01: Ask for the administrator password upfront.                                                    | "
echo "+------------------------------------------------------------------------------------------------------------+"

sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.02: Updating OSX.  If this requires a restart, run the script again.                               | "
echo "+------------------------------------------------------------------------------------------------------------+"
# Install all available updates
# sudo softwareupdate -iva

sudo softwareupdate -ia --verbose

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.03: Installing Xcode Command Line Tools.                                                           | "
echo "+------------------------------------------------------------------------------------------------------------+"

# Install Xcode command line tools
xcode-select --install

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.04: If xcode-select: already installed, we are using  "Software Update"                            |"
echo "+------------------------------------------------------------------------------------------------------------+"

sudo softwareupdate --install -a --verbose

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.05: Download setup repository                                                                      |"
echo "+------------------------------------------------------------------------------------------------------------+"

export OSXDEVSETUP_HOME=$HOME/.osxdevsetup
export OSXDEVSETUP_GITPATH=https://github.com/aedenj/osx-dev-setup.git

runme() {
	cmd=$*
	echo "$cmd"
	$cmd
	ret=$?
	if [[ ${ret} != 0 ]]; then
		echo " "
		echo "ERROR: Return value non-zero for: $cmd"
		echo " "
		exit 1
	fi
}

echo " "
if [ ! -d $OSXDEVSETUP_HOME ]; then
  runme git clone ${OSXDEVSETUP_GITPATH} ${OSXDEVSETUP_HOME} --recursive
else
  echo "INFO: The repository ${OSXDEVSETUP_GITPATH} has already been cloned to ${OSXDEVSETUP_HOME}."
fi

cd ${OSXDEVSETUP_HOME}
echo " "
