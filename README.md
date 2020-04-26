# Install

## OSX:

### Get the latest Xcode.

```
xcode-select --install
```
click ‘install’

click ‘Agree’


Install all pending updates--or use the App Store to update just xcode

```
softwareupdate --install --all
```

### install pip and ansible

```

sudo easy_install pip

sudo pip install --ignore-installed ansible

sudo chown -R `whoami`:admin /usr/local

```

## Ubuntu 16.04:

### install ansible and git

```
sudo apt-get install software-properties-common

sudo apt-add-repository -y ppa:ansible/ansible

sudo apt-get update

sudo apt-get install -y ansible git

```
## Both

### clone the repo and run ansible

```
git clone https://github.com/novakps/sherpa.git

cd sherpa

ansible-galaxy install -r requirements.yml

ansible-playbook -K site.yml
```
## Notes

### MacOSX

Virtualbox fails to install at the moment due to:
```
✗ brew info virtualbox
Error: No available formula with the name "virtualbox"
Found a cask named "virtualbox" instead.

virtualbox: 6.1.6,137129
https://www.virtualbox.org/
/usr/local/Caskroom/virtualbox/6.1.6,137129 (3 files, 117.6MB)
From: https://github.com/Homebrew/homebrew-cask/blob/master/Casks/virtualbox.rb
==> Name
Oracle VirtualBox
==> Artifacts
VirtualBox.pkg (Pkg)
==> Caveats
virtualbox requires a kernel extension to work.
If the installation fails, retry after you enable it in:
  System Preferences → Security & Privacy → General

For more information, refer to vendor documentation or this Apple Technical Note:
  https://developer.apple.com/library/content/technotes/tn2459/_index.html
```
After enabling it, just rerun sherpa.
