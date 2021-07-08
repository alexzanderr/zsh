#
#
# this script must be run with SUDO
#
#

pwd

mkdir -p ~/.config/zsh

git clone https://github.com/alexzanderr/zsh
cd zsh

# in case it doesnt exist

# copy only what we need
cp alexzander-custom.zsh-theme ~/.config/zsh
cp .zshrc ~/.config/zsh
cp -r zsh_python_scripts ~/.config/zsh

# without this you are mucles
# in case it doesnt exist
sudo mkdir -p /etc/zsh
sudo cp zshenv /etc/zsh
sudo cp zprofile /etc/zsh


cd ~/.config/zsh

# installing zplug (its just copy paste from github)
git clone https://github.com/zplug/zplug ./.zplug

# installing oh-my-zsh framework
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh

# installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions

echo -e "\ndone.\n"
