#
#
# this script must be run with SUDO
#
#


username=$USER
home=/home/$username

cd $home

pwd

# removing everything to make clean
rm -rf $home/.config/zsh
rm -rf /root/.config/zsh

# creating empty dirs
mkdir -p $home/.config/zsh
mkdir -p /root/.config/zsh

# removing the git cloned repo if already existent
rm -rf $home/zsh
rm -rf /root/zsh

# adding the repo
git clone https://github.com/alexzanderr/zsh
cd zsh

# in case it doesnt exist

# copy only what we need

# the prompt
cp alexzander-custom.zsh-theme $home/.config/zsh
cp alexzander-custom.zsh-theme /root/.config/zsh

# the rc
cp .zshrc $home/.config/zsh
cp .zshrc /root/.config/zsh

# my custom scripts
cp -r zsh_python_scripts $home/.config/zsh
cp -r zsh_python_scripts /root/.config/zsh


# without this you are mucles
# in case it doesnt exist
rm -rf /etc/zsh
mkdir -p /etc/zsh

cp zshenv /etc/zsh
cp zprofile /etc/zsh


# installing everything in home config
cd $home/.config/zsh
git clone https://github.com/zplug/zplug ./.zplug
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions


# installing everything in root config
cd /root/.config/zsh
git clone https://github.com/zplug/zplug ./.zplug
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions


echo -e "\ndone.\n"

echo -e "\nzsh activated\n"

zsh
