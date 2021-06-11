#!/bin/bash

#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

# Declaracion de variables
username=""
file=$(readlink -f $0)
current_path=$(dirname $file)
info_path=$current_path/info


function check(){
	if [[ "$(echo $?)" == "0" ]]; then
		echo -e "${cyan}\n$(cat $info_path/$info_lang | awk 'NR==24')\n${end}"
	else
		echo -e "${red}\n$(cat $info_path/$info_lang | awk 'NR==25')\n${end}"
		exit 1
	fi
}

function updates_and_dependencies(){
	# Actualizando el sistema
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==31')\n${end}"

		sudo apt update; check
		echo -e "\n${purple}$(cat $info_path/$info_lang | awk 'NR==32')${end}"
		echo -e "${red}$(cat $info_path/$info_lang | awk 'NR==33')${end}"
		echo -ne "\n\t - [${yellow}1${end}] $(cat $info_path/$info_lang | awk 'NR==2')\n\t - [${yellow}2${end}] $(cat $info_path/$info_lang | awk 'NR==3')\n\t $(cat $info_path/$info_lang | awk 'NR==4') "

						echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==35')\n${end}"
						echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}sudo apt upgrade${end}";
						sudo apt upgrade -y; check
						break
					
	
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==38')\n${end}"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==7')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==8')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==9')${end}"
	sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y; check
	
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==12')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==13')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==14')${end}"
	sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y; check
	
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==17')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==18')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==19')${end}"
	sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y; check
	sudo apt purge redshift redshift-gtk -y > /dev/null 2>&1 # Eliminar problema de redshift
}

function bspwm_and_sxhkd(){
	# Eliminando existencias
	rm -f -r -p ~/.config/{bspwm,sxhkd} 2>/dev/null
	rm -f -r ~/.config/bspwm/scripts 2>/dev/null
	rm -f -r ~/bspwm 2>/dev/null
	rm -f -r ~/sxhkd 2>/dev/null
	sudo rm -f /usr/local/share/doc/bspwm/examples/bspwmrc 2>/dev/null
	sudo rm -f /usr/local/share/doc/bspwm/examples/sxhkdrc 2>/dev/null
	rm -f ~/.xinitrc 2>/dev/null
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==41')\n${end}"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==22')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==23')"
	sudo apt install bspwm rofi gnome-terminal dunst scrub xclip -y
	# Instalación de bspwm y sxhkd
	echo && echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==26')${end}"
	for i in $(seq 27 30); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==31')${end}"
	cd && git clone https://github.com/baskerville/bspwm.git
	git clone https://github.com/baskerville/sxhkd.git
	cd bspwm && make && sudo make install
	cd ../sxhkd && make && sudo make install
	# Configuracion y ejecución de bspwm
	#cd && cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	#cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
	echo && echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==32')${end}"
	for i in $(seq 33 38); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==39')${end}"
	mkdir -p ~/.config/{bspwm,sxhkd}
	mkdir ~/.config/bspwm/scripts
	rm ~/.config/bspwm/bspwmrc 2>/dev/null
	cp $current_path/bspwmrc ~/.config/bspwm/
	cat ~/.config/bspwm/bspwmrc | sed "s/username/$(whoami)/g" > ~/.config/bspwm/bspwmrc
	chmod u+x ~/.config/bspwm/bspwmrc
	rm ~/.config/sxhkd/sxhkdrc 2>/dev/null
	cp $current_path/sxhkdrc ~/.config/sxhkd/
	cat ~/.config/sxhkd/sxhkdrc | sed "s/username/$(whoami)/g" > ~/.config/sxhkd/sxhkdrc
	cp $current_path/bspwm_resize ~/.config/bspwm/scripts/ && chmod +x ~/.config/bspwm/scripts/bspwm_resize
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==40')${end}"
	for i in $(seq 41 42); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	touch ~/.xinitrc
	echo -e "sxhkd &\nexec bspwm" > ~/.xinitrc
}

function compton_and_feh(){
	# Eliminando existencias
	rm -f -r ~/.config/compton 2>/dev/null
	# Instalando compton
	mkdir ~/.config/compton
	mkdir -p ~/Wallpapers 2>/dev/null
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==44')\n${end}"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==45')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==46')${end}"
	sudo apt install compton feh -y; check
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==45')\n${end}"
	cp $current_path/FondoDePantalla.jpg ~/Wallpapers/ ; check
	cp $current_path/compton.conf ~/.config/compton/ ; check
}

function scripts(){
	# Eliminando existencias
	rm -f -r ~/.config/bin 2>/dev/null
	# Añadiendo scripts
	mkdir ~/.config/bin; check
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==48')\n${end}"
	#cd ~/.config/bin
	cp $current_path/hackthebox.sh ~/.config/bin/ && chmod +x ~/.config/bin/hackthebox.sh
	cp $current_path/ethernet_status.sh ~/.config/bin/ && chmod +x ~/.config/bin/ethernet_status.sh
	echo -e '#!/bin/bash\n\necho -e "%{F#FF0000} %{F#e2ee6a}$(whoami)%{u-}"' > ~/.config/bin/$(whoami).sh && chmod +x ~/.config/bin/$(whoami).sh
	#while true; do
		#echo -e "${purple}[?] ¿Tienes netbook o notebook?${end}\n${red}[!] Esta pregunta es para instalar un módulo sobre la batería${end}"
		#echo -ne "\t- [${yellow}1${end}] Si\n\t- [${yellow}2${end}] No\n\t- Opción: "
		#read check_battery
		#if [ $check_battery == 1 ]; then
			#cp $current_path/battery.sh ~/.config/bin/
			#sed -i 's/sep alsa sep/sep battery sep alsa sep/' ~/.config/polybar/config.ini
			#break
		#elif [ $check_battery == 2 ]; then
			#break
		#else
			#:
		#fi
	#done
}

function font(){
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==51')${end}"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==49')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==50')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==51')${end}"
	cd /usr/local/share/fonts && sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && sudo unzip Hack.zip
	sudo rm Hack.zip
	sleep 1
}

function polybar(){
	# Eliminar existencias
	rm -f -r ~/.config/polybar 2>/dev/null
	rm -f -r ~/polybar-themes 2>/dev/null
	# Instalar polybar y su tema
	mkdir ~/.config/polybar
	sudo whoami > /dev/null 2>&1; check

		clear
		
		#OPCION POR COMPILACION (ESTABLE CON TODO)
			sudo rm -f -r /opt/polybar/ 2>/dev/null # Eliminar existencia
			echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==58')\n${end}"
			cd /opt
			sudo rm -f /opt/polybar-3.4.3.tar 2>/dev/null # Eliminar existencia
			echo && echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==54')${end}"
			echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==55')${end}"
			echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==56')${end}"
			sudo wget https://github.com/polybar/polybar/releases/download/3.4.3/polybar-3.4.3.tar; check
			sudo tar -xf polybar-3.4.3.tar; check
			sudo rm -f /opt/polybar-3.4.3.tar
			echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==57')${end}"
			for i in $(seq 58 61); do
				echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
			done
			echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==62')${end}"
			cd /opt/polybar && sudo mkdir build && cd build
			sudo cmake .. ; check
			sudo make -j$(nproc); check
			sudo make install; check
			
		
			#OPCION POR REPOSITORIO
			# Eliminar existencia
			#sudo rm -f -r /opt/polybar/ 2>/dev/null
			#echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==58')\n${end}"
			#echo -e "${cyan}$(cat $info_path/$guide_lang | awk 'NR==2')${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==63')${end}"
			#sudo apt install polybar -y; check

	echo -e "\n${cyan}$(cat $info_path/$info_lang | awk 'NR==59')${end}"
	num_theme=0
	option=0

		echo -e "${purple}$(cat $info_path/$info_lang | awk 'NR==60') Hack Nerd Font - Hack Nerd Font Mono Regular\n${end}"
		echo -e "${cyan}\t$(cat $info_path/$info_lang | awk 'NR==61')${end}"
		echo -e "${green}\t$(cat $info_path/$info_lang | awk 'NR==62')${end}"

	
	echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==64')\n${end}"
	cp -r $current_path/polybar-themes/ ~/

		echo -ne "\n${purple}$(cat $info_path/$info_lang | awk 'NR==65')${end}\n${cyan}$(cat $info_path/$info_lang | awk 'NR==66')${end}\n\t$(cat $info_path/$info_lang | awk 'NR==67') "
		num_theme=11
			for i in $(seq 67 74); do
				echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
			done
			echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==4') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==75')${end}"
			rm ~/.config/polybar/launch.sh 2>/dev/null
			cd ~/polybar-themes/polybar-$num_theme
			mkdir -p ~/.local/share/fonts
			cp -r fonts/* ~/.local/share/fonts
			fc-cache -v
			sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf 2>/dev/null
			cp -r * ~/.config/polybar
			~/.config/polybar/launch.sh 2>/dev/null

					echo -e "\n${cyan}$(cat $info_path/$info_lang | awk 'NR==70')${end}"


				echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==73')${end}"
				rm -f -r ~/.config/polybar 2>/dev/null
				tar -xf $current_path/Comprimido.tar -C ~/.config/ 
				rm ~/.config/polybar/launch.sh
				rm ~/.config/polybar/config.ini
				cp $current_path/launch.sh ~/.config/polybar/ && sleep 1 && chmod +x ~/.config/polybar/launch.sh
				cp $current_path/config.ini ~/.config/polybar/
				cat ~/.config/polybar/config.ini | sed "s/username/$(whoami)/g" > ~/.config/polybar/config.ini
				scripts
				sleep 1
				~/.config/polybar/launch.sh 2>/dev/null ;check
				
}

function powerlevel10k_zsh_username(){
	# Eliminar existencias
	rm -f -r ~/powerlevel10k 2>/dev/null
	rm -f ~/.zshrc 2>/dev/null
	# Instalando powerlevel10k
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==76') $(whoami)${end}\n"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==78')${end}"
	for i in $(seq 79 80); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==81')${end}"
	#echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==82') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==83')${end}"
	cd && git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k; check
	# Mi configuracion
	echo -e "\t${cyan}Aplicando configuracion de Shockz"
	cp $current_path/.p10k.zsh /home/$username/
	cp $current_path/.zshrc /home/$username/
	#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc; check
	#echo -e "${purple}\n$(cat $info_path/$info_lang | awk 'NR==77') $(whoami)\n${end}"
	sleep 5
	#zsh
}

function powerlevel10k_zsh_root(){
	# Eliminar existencias
	sudo rm -f -r /root/powerlevel10k 2>/dev/null
	sudo rm -f /root/.zshrc 2>/dev/null
	# Instalando powerlevel10k
	sudo echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==76') root${end}\n"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==86')${end}"
	for i in $(seq 87 88); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==3') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==89')${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==137') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==138')${end}"
	sudo git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git /root/powerlevel10k; check
        echo -e "\t${cyan}Aplicando configuracion de Shockz a ROOT"
        sudo cp $current_path/.p10k.zsh /root/
        sudo cp $current_path/.zshrc /root/
        #echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc; check
        #echo -e "${purple}\n$(cat $info_path/$info_lang | awk 'NR==77') $(whoami)\n${end}"
        sleep 5
        #zsh
}

function powerlevel10k_zsh_username_config(){
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==80') $(whoami)...\n${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==4') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==92')${end}"
	sed -i "s/status                  # exit/#status                  # exit/" ~/.p10k.zsh
	sed -i "s/command_execution_time  # duration/#command_execution_time  # duration/" ~/.p10k.zsh
	sed -i "s/background_jobs         # presence/#background_jobs         # presence/" ~/.p10k.zsh
	sed -i "s/direnv                  # direnv/#direnv                  # direnv/" ~/.p10k.zsh
	sed -i "s/asdf                    # asdf/#asdf                    # asdf/" ~/.p10k.zsh
	sed -i "s/virtualenv              # python/#virtualenv              # python/" ~/.p10k.zsh
	sed -i "s/anaconda                # conda/#anaconda                # conda/" ~/.p10k.zsh
	sed -i "s/pyenv                   # python/#pyenv                   # python/" ~/.p10k.zsh
	sed -i "s/goenv                   # go/#goenv                   # go/" ~/.p10k.zsh
	sed -i "s/nodenv                  # node.js/#nodenv                  # node.js/" ~/.p10k.zsh
	sed -i "s/nvm                     # node.js/#nvm                     # node.js/" ~/.p10k.zsh
	sed -i "s/nodeenv                 # node.js/#nodeenv                 # node.js/" ~/.p10k.zsh
	sed -i "s/rbenv                   # ruby/#rbenv                   # ruby/" ~/.p10k.zsh
	sed -i "s/rvm                     # ruby/#rvm                     # ruby/" ~/.p10k.zsh
	sed -i "s/fvm                     # flutter/#fvm                     # flutter/" ~/.p10k.zsh
	sed -i "s/luaenv                  # lua/#luaenv                  # lua/" ~/.p10k.zsh
	sed -i "s/jenv                    # java/#jenv                    # java/" ~/.p10k.zsh
	sed -i "s/plenv                   # perl/#plenv                   # perl/" ~/.p10k.zsh
	sed -i "s/phpenv                  # php/#phpenv                  # php/" ~/.p10k.zsh
	sed -i "s/scalaenv                # scala/#scalaenv                # scala/" ~/.p10k.zsh
	sed -i "s/haskell_stack           # haskell/#haskell_stack           # haskell/" ~/.p10k.zsh
	sed -i "s/kubecontext             # current/#kubecontext             # current/" ~/.p10k.zsh
	sed -i "s/terraform               # terraform/#terraform               # terraform/" ~/.p10k.zsh
	sed -i "s/aws                     # aws/#aws                     # aws/" ~/.p10k.zsh
	sed -i "s/aws_eb_env              # aws/#aws_eb_env              # aws/" ~/.p10k.zsh
	sed -i "s/azure                   # azure/#azure                   # azure/" ~/.p10k.zsh
	sed -i "s/gcloud                  # google/#gcloud                  # google/" ~/.p10k.zsh
	sed -i "s/google_app_cred         # google/#google_app_cred         # google/" ~/.p10k.zsh
	sed -i "s/context                 # user@hostname/#context                 # user@hostname/" ~/.p10k.zsh
	sed -i "s/nordvpn                 # nordvpn/#nordvpn                 # nordvpn/" ~/.p10k.zsh
	sed -i "s/ranger                  # ranger/#ranger                  # ranger/" ~/.p10k.zsh
	sed -i "s/nnn                     # nnn/#nnn                     # nnn/" ~/.p10k.zsh
	sed -i "s/vim_shell               # vim/#vim_shell               # vim/" ~/.p10k.zsh
	sed -i "s/midnight_commander      # midnight/#midnight_commander      # midnight/" ~/.p10k.zsh
	sed -i "s/nix_shell               # nix/#nix_shell               # nix/" ~/.p10k.zsh
	sed -i "s/vi_mode                 # vi/#vi_mode                 # vi/" ~/.p10k.zsh
	sed -i "s/todo                    # todo/#todo                    # todo/" ~/.p10k.zsh
	sed -i "s/timewarrior             # timewarrior/#timewarrior             # timewarrior/" ~/.p10k.zsh
	sed -i "s/taskwarrior             # taskwarrior/#taskwarrior             # taskwarrior/" ~/.p10k.zsh
	sed -i "s/vcs                     # git status/vcs                     # git status\n    status\n    command_execution_time\n    context/" ~/.p10k.zsh
}

function powerlevel10k_zsh_root_config(){
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==80') $(whoami)\n${end}"
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==4') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==95')${end}"
	sudo sed -i "s/status                  # exit/#status                  # exit/" /root/.p10k.zsh
	sudo sed -i "s/command_execution_time  # duration/#command_execution_time  # duration/" /root/.p10k.zsh
	sudo sed -i "s/background_jobs         # presence/#background_jobs         # presence/" /root/.p10k.zsh
	sudo sed -i "s/direnv                  # direnv/#direnv                  # direnv/" /root/.p10k.zsh
	sudo sed -i "s/asdf                    # asdf/#asdf                    # asdf/" /root/.p10k.zsh
	sudo sed -i "s/virtualenv              # python/#virtualenv              # python/" /root/.p10k.zsh
	sudo sed -i "s/anaconda                # conda/#anaconda                # conda/" /root/.p10k.zsh
	sudo sed -i "s/pyenv                   # python/#pyenv                   # python/" /root/.p10k.zsh
	sudo sed -i "s/goenv                   # go/#goenv                   # go/" /root/.p10k.zsh
	sudo sed -i "s/nodenv                  # node.js/#nodenv                  # node.js/" /root/.p10k.zsh
	sudo sed -i "s/nvm                     # node.js/#nvm                     # node.js/" /root/.p10k.zsh
	sudo sed -i "s/nodeenv                 # node.js/#nodeenv                 # node.js/" /root/.p10k.zsh
	sudo sed -i "s/rbenv                   # ruby/#rbenv                   # ruby/" /root/.p10k.zsh
	sudo sed -i "s/rvm                     # ruby/#rvm                     # ruby/" /root/.p10k.zsh
	sudo sed -i "s/fvm                     # flutter/#fvm                     # flutter/" /root/.p10k.zsh
	sudo sed -i "s/luaenv                  # lua/#luaenv                  # lua/" /root/.p10k.zsh
	sudo sed -i "s/jenv                    # java/#jenv                    # java/" /root/.p10k.zsh
	sudo sed -i "s/plenv                   # perl/#plenv                   # perl/" /root/.p10k.zsh
	sudo sed -i "s/phpenv                  # php/#phpenv                  # php/" /root/.p10k.zsh
	sudo sed -i "s/scalaenv                # scala/#scalaenv                # scala/" /root/.p10k.zsh
	sudo sed -i "s/haskell_stack           # haskell/#haskell_stack           # haskell/" /root/.p10k.zsh
	sudo sed -i "s/kubecontext             # current/#kubecontext             # current/" /root/.p10k.zsh
	sudo sed -i "s/terraform               # terraform/#terraform               # terraform/" /root/.p10k.zsh
	sudo sed -i "s/aws                     # aws/#aws                     # aws/" /root/.p10k.zsh
	sudo sed -i "s/aws_eb_env              # aws/#aws_eb_env              # aws/" /root/.p10k.zsh
	sudo sed -i "s/azure                   # azure/#azure                   # azure/" /root/.p10k.zsh
	sudo sed -i "s/gcloud                  # google/#gcloud                  # google/" /root/.p10k.zsh
	sudo sed -i "s/google_app_cred         # google/#google_app_cred         # google/" /root/.p10k.zsh
	sudo sed -i "s/context                 # user@hostname/#context                 # user@hostname/" /root/.p10k.zsh
	sudo sed -i "s/nordvpn                 # nordvpn/#nordvpn                 # nordvpn/" /root/.p10k.zsh
	sudo sed -i "s/ranger                  # ranger/#ranger                  # ranger/" /root/.p10k.zsh
	sudo sed -i "s/nnn                     # nnn/#nnn                     # nnn/" /root/.p10k.zsh
	sudo sed -i "s/vim_shell               # vim/#vim_shell               # vim/" /root/.p10k.zsh
	sudo sed -i "s/midnight_commander      # midnight/#midnight_commander      # midnight/" /root/.p10k.zsh
	sudo sed -i "s/nix_shell               # nix/#nix_shell               # nix/" /root/.p10k.zsh
	sudo sed -i "s/vi_mode                 # vi/#vi_mode                 # vi/" /root/.p10k.zsh
	sudo sed -i "s/todo                    # todo/#todo                    # todo/" /root/.p10k.zsh
	sudo sed -i "s/timewarrior             # timewarrior/#timewarrior             # timewarrior/" /root/.p10k.zsh
	sudo sed -i "s/taskwarrior             # taskwarrior/#taskwarrior             # taskwarrior/" /root/.p10k.zsh
	sudo sed -i "s/vcs                     # git status/vcs                     # git status\n    status\n    command_execution_time\n    context/" /root/.p10k.zsh
	sudo sed -i "s/typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='.*'/typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE=''/" /root/.p10k.zsh
	sudo sed -i "s/typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='.*'/#typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'/" /root/.p10k.zsh
	sudo sed -i "s/typeset -g POWERLEVEL9K_CONTEXT_PREFIX='.*'/#typeset -g POWERLEVEL9K_CONTEXT_PREFIX='with '/" /root/.p10k.zsh
	echo -e "${yellow}\n$(cat $info_path/$info_lang | awk 'NR==81')\n${end}"
	# Eliminando existencias
	sudo rm /root/.zshrc
	sudo rm /home/$username/.zshrc
	echo -e "${cyan}$(cat $info_path/$info_lang | awk 'NR==82')${end}"
	cp $current_path/zshrc_config /home/$username/
	sed -i "s/user_name/$username/" /home/$username/zshrc_config && mv /home/$username/zshrc_config /home/$username/.zshrc
	sudo chown $username:$username /home/$username/.zshrc
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk 'NR==98')${end}"
	sudo ln -s -f /home/$username/.zshrc /root/.zshrc
	echo -e "\n${cyan}$(cat $info_path/$info_lang | awk 'NR==83')${end}\n"
	for i in $(seq 101 102); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	sudo usermod --shell /usr/bin/zsh $username 2>/dev/null
	sudo usermod --shell /usr/bin/zsh root 2>/dev/null
	echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==84')${end}\n"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==105')${end}"
	for i in $(seq 106 107); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==108') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==109')${end}"
	cd /opt && sudo wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
	sudo dpkg -i lsd_0.18.0_amd64.deb && sleep 1 && sudo rm lsd_0.18.0_amd64.deb
	echo -e "\n${yellow}$(cat $info_path/$info_lang | awk 'NR==85')${end}\n"
	echo -e "${blue}$(cat $info_path/$guide_lang | awk 'NR==112')${end}"
	for i in $(seq 113 114); do
    	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==108') ${end}${purple}$(cat $info_path/$guide_lang | awk 'NR==115')${end}"
	sudo wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
	sudo dpkg -i bat_0.17.1_amd64.deb && sleep 1 && sudo rm bat_0.17.1_amd64.deb
}

function plugins(){
	echo -e "${yellow}$(cat $info_path/$info_lang | awk 'NR==88')\n${end}"
	for i in $(seq 118 120); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	for i in $(seq 121 124); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	for i in $(seq 125 126); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==108') ${end}${purple}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	sudo apt install zsh-syntax-highlighting zsh-autosuggestions -y
	cd /usr/share && sudo mkdir zsh-sudo && cd zsh-sudo && sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
	chmod +x /usr/share/zsh-sudo/sudo.plugin.zsh
	cd /usr/share && sudo chown $username:$username -R zsh-*
}

function fzf_username(){
	sudo rm -f -r /home/$username/.fzf 2>/dev/null # Eliminar existencia
	echo -e "${yellow}$(cat $info_path/$info_lang | awk 'NR==91') $(whoami)...\n${end}"
	for i in $(seq 129 130); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}

function fzf_root(){
	sudo rm -f -r /root/.fzf 2>/dev/null # Eliminar existencia
	echo -e "${yellow}$(cat $info_path/$info_lang | awk 'NR==91') $(whoami)...\n${end}"
	for i in $(seq 133 134); do
		echo -e "\t${cyan}$(cat $info_path/$guide_lang | awk 'NR==2') ${end}${yellow}$(cat $info_path/$guide_lang | awk "NR==$i")${end}"
	done
	sudo git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
	/root/.fzf/install
}

function custom_scripts(){

	# Cambiar teclado a español
	sudo setxkbmap -layout 'es,es' -model pc105

	# Configuracion SSH
	echo -e "${cyan}[+] Aplicando configuracion ssh${end}"
	sudo apt-get install openssh-server openssh-client -y
	##con awk port 22 para habilitar ssh /etc/ssh/sshd_config si es necesario
	sudo systemctl enable ssh
	sudo systemctl restart ssh

	# Diccionarios
	echo -e "${cyan}[+] Extrayendo rockyou${end}"
	gunzip /usr/share/wordlists/rockyou.txt.gz
	echo -e "${cyan}[+] Instalando Kaonashi${end}"
	sudo apt-get install lftp -y
	wordlist_path=$current_path/wordlists
	echo "$wordlist_path"
	sudo lftp -c "torrent $wordlist_path/kaonashi14M.7z.torrent $wordlist_path/kaonashiWPA100M.7z.torrent $wordlist_path/kaonashi.7z.torrent"
	sudo mkdir /usr/share/wordlists/kaonashi
	sudo mv $current_path/kaonashi14M.7z $current_path/kaonashiWPA100M.7z $current_path/kaonashi.7z /usr/share/wordlists/kaonashi
	cd /usr/share/wordlists/kaonashi && 7z x ./kaonashi14M.7z && 7z x ./kaonashiWPA100M.7z && 7z x ./kaonashi.7z && rm kaonashi14M.7z kaonashiWPA100M.7z kaonashi.7z
	echo -e "${cyan}[+] Copiando otras wordlists ${end}"
	sudo cp $wordlist_path/pwned-passwords-sha1-ordered-by-count-v7.7z.torrent /usr/share/wordlists/

	echo -e "${cyan}[+] Configurando actualizaciones automaticas en boot ${end}"
	sudo apt install unattended-upgrades -y && dpkg-reconfigure --priority=low unattended-upgrades
	#echo -e "${cyan}[+] Instalando ufw ${end}"
	#sudo apt install ufw -y
	#sudo sudo ufw enable
	# Copiando los drivers y scripts para la configuración del adaptador de red wifi
	echo -e "${cyan}[+] Copiando los drivers y scripts para la configuración del adaptador de red wifi ${end}"
	cp $current_path/TP_LINK_ADAPTER.zip /home/$username
	cd /home/$username && unzip TP_LINK_ADAPTER.zip && rm TP_LINK_ADAPTER.zip
	#Instalación de airgeddon
	echo -e "${cyan}[+] Instalando airgeddon ${end}"
	cd /usr/bin && sudo git clone https://github.com/v1s1t0r1sh3r3/airgeddon

}


info_lang="info_es.txt"
guide_lang="guide_mode_es.txt"

:''
echo -e "\t${cyan}[-] 1. No root 2. Root"

	if [[ $1 == 1 ]];then	
			updates_and_dependencies
			
			bspwm_and_sxhkd
			
			compton_and_feh
			
			font

		if [[ "$(whoami)" != "root" ]]; then
			username=$(whoami)
			
			polybar
			
			powerlevel10k_zsh_username
		
			powerlevel10k_zsh_username_config
			
			fzf_username
		fi

	elif [[ $1 == 2 ]];then
		if [[ "$(whoami)" == "root" ]]; then
			powerlevel10k_zsh_root

			echo -ne "${yellow}$(cat $info_path/$info_lang | awk 'NR==100') ${end}"
			read username
			grep $username /etc/passwd >/dev/null 2>&1
			if [[ "$(echo $?)" == "0" ]]; then
				echo -ne "${red}$(cat $info_path/$info_lang | awk 'NR==101') ${end}${cyan}$username${end}${red}\n$(cat $info_path/$info_lang | awk 'NR==8')${end}${yellow}1${end}${red}$(cat $info_path/$info_lang | awk 'NR==9') ${end}"
				read option3
				if [ $option3 == 1 ]; then
					
					powerlevel10k_zsh_root_config
					
					plugins
					
					fzf_root
					
					custom_scripts

					option5=0
					while [ $option5 != 1 ]; do
						
						echo -e "${cyan}\n$(cat $info_path/$info_lang | awk 'NR==102')${end}"
						echo -e "${red}\n$(cat $info_path/$info_lang | awk 'NR==103')${end}"
						echo -ne "${red}\n$(cat $info_path/$info_lang | awk 'NR==10')${end}${yellow}1${end}${red}$(cat $info_path/$info_lang | awk 'NR==11') ${end}"
						read option5
					done
					echo -e "${cyan}\n[!]Acuerdate de configurar el proxy de Burp Suite (+ certificado) | FoxyProxy y Wappalizer${end}"
					echo -e "${cyan}\n[!]Acuerdate de intalar Burpsuite 1.7.36 ( https://portswigger.net/burp/releases/professional-community-1-7-36 ) y la configuración del adapatador de red wifi${end}"
					shutdown -r 0
				else
					exit 1
				fi
			fi
		else
			echo -e "\t${red}[!] Utiliza Sudo${end}"
		fi
	fi
