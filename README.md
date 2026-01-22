# homebrew-taptest

- THISDIR(homebrew-???) ... "git clone"ed directory
- mkdir /opt/homebrew/Library/Taps/USERNAME(ANY)/
- ln -s THISDIR /opt/homebrew/Library/Taps/USERNAME/THISDIR
- ./check-before-push.sh USERNAME/THISDIR
- (optional) UNINSTALL=1 ./check-before-push.sh USERNAME/THISDIR
