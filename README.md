# OSX Dev Setup

Bootstrap the setup process by running the following, 

```
cd ~/ && curl -O https://raw.githubusercontent.com/aedenj/osx-dev-setup/master/bootstrap.sh; chmod 744 bootstrap.sh; ./bootstrap.sh;rm ~/bootstrap.sh;cd ~/.osxdevsetup
```

The bootstrap script downloaded above will initiate OS X updates, install the XCode command line tools and clone this repository that contains the rest of the setup scripts into `~/.osxdevsetup`.
Because some updates require restarts re-run the bootstrap script from `~/.osxdevsetup` until no updates are left.

