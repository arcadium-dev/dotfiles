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
[automount]
enabled=false
root=//wsl.localhost/Ubuntu-20.04.01/home/icahoon

[network]
hostname = arcade1
generateHosts = false
generateResolvConf = false

[interop]
enabled = false
appendWindowsPath = false

[user]
default=icahoon

[boot]
command = service docker start
```
