# Awesome SSH & Keys Cheatsheet

**Create a new ssh key**

To create a new ssh key:

```
ssh-keygen -t rsa -C "your_email@example.com"
```


**Add a ssh key**

To add a new key to the ssh agent:

```
eval `ssh-agent`
ssh-add ./id_rsa
```


**Convert a ssh2 key to openssh format** (Source: [tutoriallinux](https://tutorialinux.com/convert-ssh2-openssh/))

```
# directly write to a file
ssh-keygen -i -f ssh2.pub > openssh.pub

# just print the output
ssh-keygen -i -f ssh2.pub
```
