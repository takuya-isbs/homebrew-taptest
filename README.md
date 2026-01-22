# homebrew-taptest

- THISDIR(homebrew-TAPNAME) ... "git clone"ed directory
- mkdir /opt/homebrew/Library/Taps/USERNAME(ANY)/
- ln -s THISDIR /opt/homebrew/Library/Taps/USERNAME/THISDIR
- ./check-before-push.sh USERNAME/TAPNAME
- (optional) UNINSTALL=1 ./check-before-push.sh USERNAME/TAPNAME

## GitHub Actions Runner

https://docs.github.com/en/actions/reference/runners/github-hosted-runners#standard-github-hosted-runners-for-public-repositories
