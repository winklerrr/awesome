# Awesome SSH Keygen Cheatsheet

**Create a new SSH key**

To create a new SSH (secure shell) key, do:
```
ssh-keygen -t rsa -C "your_email@example.com"
```

To copy the newly generated SSH key, do (assuming the new key has been saved as id_rsa):
```
cat ~/.ssh/id_rsa.pub | copy
```

**Add a SSH key**

To add a new key to the local SSH agent, do:
```
eval `ssh-agent`
ssh-add ./id_rsa
```


**Convert a SSH2 key to the OpenSSH format** (Source: [tutoriallinux](https://tutorialinux.com/convert-ssh2-openssh/))

```
# directly write to a file
ssh-keygen -i -f ssh2.pub > openssh.pub

# just print the output
ssh-keygen -i -f ssh2.pub
```
