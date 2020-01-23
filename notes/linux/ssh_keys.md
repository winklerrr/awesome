# Awesome SSH & Key Notes

Add a key to ssh:

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
