#
#
# this script must be run with SUDO
#
#


git clone https://github.com/alexzanderr/zsh
cd zsh

# in case it doesnt exist
mkdir -p ~/.config/zsh

# copy only what we need
cp -r ./alexzander-custom.zsh-theme ./.zshrc ./zsh_python_scripts ~/.config/zsh

# without this you are mucles
# in case it doesnt exist
sudo mkdir -p /etc/zsh
sudo cp ./zshenv /etc/zsh
sudo cp ./zprofile /etc/zsh


cd ~/.config/zsh

# installing zplug (its just copy paste from github)
git clone https://github.com/zplug/zplug ./.zplug

# installing oh-my-zsh framework
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh

# installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions

echo -e "\ndone.\n"
