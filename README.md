# zsh
zsh repo for auto installing on ssh machines

# auto install, just curl into sh
```shell
curl -fsSL https://raw.githubusercontent.com/alexzanderr/zsh/master/install.sh | sudo sh
```

# hardlink recusively contents inside folder into another folder
```
cp -rfl * .* /home/alexzander/Alexzander__/ssh/zsh
```
cp
-r recusively
-f force (to update if exists already)
-l make hard link instead of copy
* all
.* all hidden files and folders

last is destination
