#!bin/bash

PROMPT1="Do you want to install no machine? Y/n?"
PROMPT1NO="Nomachine Not installed"
PROMPT2="Do you want to install GDM gnome? Y/n"
PROMPT2NO="GDM Not installed"

echo "running apt update and upgrade"
sudo apt update 
sleep 2 
sudo apt upgrade -y 


confirmation_installation(){
    while true; do
	read -p "${1}" choice
	 case "$choice" in
	 [Yy]* ) return 0;; #user accepts 
	 [Nn]* ) return 1;; #user declines
          * ) echo "Please answer (y)es or (n)o";;
         esac
   done
}

if confirmation_installation "\{$PROMPT1}"  ; 
  then 
    wget https://download.nomachine.com/download/8.14/Linux/nomachine_8.14.2_1_amd64.deb
    sudo dpkg -i nomachine_8.14.2_1_amd64.deb
    rm ./nomachine_8.14.2_1_amd64.deb
  else
    echo $PROMPT1NO
fi
    
    
if confirmation_installation "\{$PROMPT2}" ; 
  then 
	sudo apt install gdm -y     
  else $PROMPT2NO
fi

echo "installing docker"

#for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done


# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo docker run hello-world

sudo groupadd docker

sudo usermod -aG docker $USER
newgrp docker


docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.5


ip=$(hostname -I | awk '{print $1}')
echo "portainer is now running on the local computer at https://$ip:9443"




