# Install

## OSX:

```
xcode-select --install
```
click ‘install’

click ‘Agree’
```

sudo easy_install pip

sudo pip install ansible

```

## Ubuntu 14.04:

```
sudo apt-add-repository -y ppa:ansible/ansible 

sudo apt-get update

sudo apt-get install -y ansible

sudo apt-get install git

```
## Both

```
git clone https://github.com/novakps/sherpa.git

ansible-playbook -i 'localhost,' -c local —-ask-sudo-pass sherpa/site.yml
```



