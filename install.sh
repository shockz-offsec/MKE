#!/bin/bash

blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
red="\e[0;31m\033[1m"
end="\033[0m\e[0m"

userPath=/home/shockz
rootPath=/root
file=$(readlink -f $0)
current_path=$(dirname $file)


# COSAS DE MI MKE = ZSHRC SCRIPTS
# ECHAR UN OJO AL TEMA DE USERS ~ Y SUDO 


function user_shockz(){
    # Teclado español
    sudo setxkbmap -layout 'es,es' -model pc105

    apt-get update && apt-get upgrade -y
    apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y

    # Instalacion de gnome-terminal
    sudo apt install gnome-terminal -y

    ### BSPWM y SXHKD
    #cd ~/Descargas
    git clone https://github.com/baskerville/bspwm.git
    git clone https://github.com/baskerville/sxhkd.git

    cd bspwm/ && make && sudo make install
    cd ../sxhkd/ && make && sudo make install
    sudo apt install bspwm -y


    # Creacion de archivos de config
    #mkdir ~/.config/bspwm
    #mkdir ~/.config/sxhkd

    # COPIA DE ARCHIVOS CONF BSPWM // sxhkdrc
    #cd ~/Descargas/bspwm && cp examples/bspwmrc ~/.config/bspwm/ && chmod +x ~/.config/bspwm/bspwmrc
    #cp examples/sxhkdrc ~/.config/sxhkd/


    # Resize
    #mkdir ~/.config/bspwm/scripts/

    #cp XXresize  ~/.config/bspwm/scripts/bspwm_resize
    #chmod +x ~/.config/bspwm/scripts/bspwm_resize

    # Instalacion de polybar
    sudo apt update && sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
    cd $userPath/Descargas/ && git clone --recursive https://github.com/polybar/polybar && cd polybar/
    mkdir build
    cd build/ && cmake .. && make -j$(nproc) && sudo make install

    # Instalacion de picom
    sudo apt update
    sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y

    cd $userPath/Descargas && git clone https://github.com/ibhagwan/picom.git
    cd picom/ && git submodule update --init --recursive
    meson --buildtype=release . build
    ninja -C build
    sudo ninja -C build install

    # Instalacion de rofi
    sudo apt install rofi -y

    # Reinicio?

    # Firefox y Firejail
    chown shockz:shockz /opt
    # descargar firefox, muevo a opt y instalo firefox
    sudo apt install firejail -y
    #firejail /opt/firefox

    # Configurar foxyproxy y poner duckduckgo

    # Instalacion de hackfonts
    cd /usr/local/share/fonts && sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && sudo unzip Hack.zip && sudo unzip Hack.zip
    sudo rm Hack.zip

    # Instalacion de FEH (wallpapers)
    sudo apt install feh -y
    mkdir $userPath/Escritorio/wallpaper
    # MOVER Wallpaper
    cp $current_path/wallpaper/wallpaper.png $userPath/Escritorio/wallpaper/fondo.png

    # Instalacion de POLYBAR
    cd $userPath/Descargas && git clone https://github.com/VaughnValle/blue-sky.git

    # Instalacion polybar
    #git clone https://github.com/VaughnValle/blue-sky.git
    #mkdir $userPath/.config/polybar
    #cd ~/Descargas/blue-sky/polybar/
    #cp * -r ~/.config/polybar
    #echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc
    # COPIAR TODO config/polybar

    # Copia de todos los archivos de configuracion
    cp -r $current_path/config $userPath/.config
    chown -R shockz:shockz $userPath/.config

    cd fonts
    sudo cp * /usr/share/fonts/truetype/
    fc-cache -v
    ##COPIAR ~/.config/polybar/workspace.ini

    # PICOM - Gestion de transparencias
    #mkdir ~/.config/picom
    #cd ~/.config/picom
    # Copiar mi picom.conf
    #cp ~/Descargas/blue-sky/picom.conf .
    # Bordeados
    #echo 'picom --experimental-backends &' >> ~/.config/bspwm/bspwmrc 
    #echo 'bspc config border_width 0' >> ~/.config/bspwm/bspwmrc

    # Scripts/modulos bspwm
    #mkdir ~/.config/bin
    #copiamos y damos permisos ethernet y htb
    #cp 


    # Permisos de ejecucion a scripts de polybar
    chmod +x $userPath/.config/bin/*

    # Nord rofi
    #mkdir -p ~/.config/rofi/themes
    #cp ~/Descargas/blue-sky/nord.rasi ~/.config/rofi/themes
    # rofi-theme-selector => nord => alt + a 

    # Lock
    #sudo apt update
    #echo "Seleccionar slim"
    #sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev -y 
    #cd $userPath/Descargas/
    #git clone https://github.com/joelburget/slimlock.git
    #cd slimlock/ && sudo make && sudo make install
    #cd $userPath/Descargas/blue-sky/slim
    #sudo cp slim.conf /etc/
    #sudo cp slimlock.conf /etc
    #sudo cp -r default /usr/share/slim/themes


    # POWERLEVEL 10K

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $userPath/powerlevel10k
    #echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    #COPIAMOS
    #echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc
    # Reemplazar zshrc
    # Copia de zshrc y .p10.zsh
    cp $current_path/zshrc $userPath/.zshrc
    cp $current_path/p10k.zsh $userPath/.p10k.zsh

    # CHOWN a todo .config

    # Plugins zsh
    # Instalacion de bat = cat mejorado
    cd $userPath
    wget "https://github.com/sharkdp/bat/releases/download/v0.18.2/bat-musl_0.18.2_amd64.deb"
    sudo dpkg -i bat-musl_0.18.2_amd64.deb
    rm bat-musl_0.18.2_amd64.deb

    # Instalacion de lsd : listado inteligente
    wget "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb"
    sudo dpkg -i lsd-musl_0.20.1_amd64.deb
    rm lsd-musl_0.20.1_amd64.deb

    # Instalacion de fzf: autocompletado
    git clone --depth 1 https://github.com/junegunn/fzf.git $userPath/.fzf
    $userPath/.fzf/install

    cp -r $current_path/zsh-plugins /usr/share/ && chown shockz:shockz /usr/share/zsh-plugins

    #cd /usr/share && sudo mkdir zsh-plugins && sudo chown shockz:shockz zsh-plugins
    # COPIAR ZSH PLUGINS

    # Instalación de ranger
    sudo apt install ranger -y

    # Fixing burpsuite
    update-alternatives --config java

    cp $current_path/copy_paste.sh $userPath/
    cd $userPath/
    chmod +x copy_paste.sh && ./copy_paste.sh
    # FIX copy paste vmware hacer sh CREAR DEMONIO
    #sudo systemctl restart vmtoolsd.service
    #vmware-user-suid-wrapper &

    # Instalacion de scrub
    sudo apt install scrub

}

function user_root(){

    # Powerlevel 10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $rootPath/powerlevel10k
    #echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    #echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc
    cp $current_path/.p10k.zsh $rootPath/.p10k.zsh

    # Misma zshrc
    ln -s -f $userPath/.zshrc $rootPath/.zshrc

    # Para otro SO que no sea Kali (default:zsh)
    #usermod --shell /usr/bin/zsh shockz
    #usermod --shell /usr/bin/zsh root

    # Fixing de problemas migracion a users desde root
    chown shockz:shockz /root
    chown shockz:shockz /root/.cache -R
    chown shockz:shockz /root/.local -R

    # FZF autocompletado
    git clone --depth 1 https://github.com/junegunn/fzf.git $rootPath/.fzf
    $rootPath/.fzf/install

}

echo -e "
  /$$$$$$  /$$                           /$$                       /$$      /$$ /$$   /$$ /$$$$$$$$
 /$$__  $$| $$                          | $$                      | $$$    /$$$| $$  /$$/| $$_____/
| $$  \__/| $$$$$$$   /$$$$$$   /$$$$$$$| $$   /$$ /$$$$$$$$      | $$$$  /$$$$| $$ /$$/ | $$      
|  $$$$$$ | $$__  $$ /$$__  $$ /$$_____/| $$  /$$/|____ /$$/      | $$ $$/$$ $$| $$$$$/  | $$$$$   
 \____  $$| $$  \ $$| $$  \ $$| $$      | $$$$$$/    /$$$$/       | $$  $$$| $$| $$  $$  | $$__/   
 /$$  \ $$| $$  | $$| $$  | $$| $$      | $$_  $$   /$$__/        | $$\  $ | $$| $$\  $$ | $$      
|  $$$$$$/| $$  | $$|  $$$$$$/|  $$$$$$$| $$ \  $$ /$$$$$$$$      | $$ \/  | $$| $$ \  $$| $$$$$$$$
 \______/ |__/  |__/ \______/  \_______/|__/  \__/|________/      |__/     |__/|__/  \__/|________/
                                                                                                   
                                                                                                   
                                                                                                   
"

#Se comprueban los privilegios
[ "$(id -u)" -ne 0 ] && (echo -e "${red} [!] Este script debe ejecutarse con privilegios root ${end}" >&2) && exit 1;

user_shockz
user_root