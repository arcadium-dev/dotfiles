# dotfiles

## Create new wsl ubuntu instance for testing

`wsl --list`

`wsl --export Ubuntu-22.04 ubuntu-22.04.tar.gz`

`wsl --import Ubuntu-22.04.01 C:\Users\icaho\wsl\ubuntu-22.04.01 C:\users\icaho\wsl\ubuntu-22.04.tar.gz`

`wsl --list`

`wsl -d Ubuntu-22.04.01`

Create `/etc/wsl.conf` below.

`wsl --shutdown`

`wsl -d Ubunutu-22.04.01`


### /etc/wsl.conf

```
[network]
hostname = arcade1
generateResolvConf = true
```
