git config --global user.name Leonardo
git config --global user.email chuchenko1986@gmail.com
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source  ~/.bashrc  && history -a
lsblk
sudo fdisk /dev/sdc
lsblk
sudo fdisk /dev/sdd
lsblk
sudo pvcreate /dev/sdc1 /dev/sdc2 /dev/sdd1
sudo vgcreate vg_datos /dev/sdc1
sudo lvcreate -L 5M -n lv_docker vg_datos /dev/sdc1
sudo vgcreate vg_datos /dev/sdc2
sudo lvcreate -L 1.5G -n lv_workareas vg_datos /dev/sdc2
sudo vgremove vg_datos
sudo pvcreate /dev/sdc1 /dev/sdc2
sudo lvcreate -L 1.5G -n lv_workareas vg_datos /dev/sdc2
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2
sudo lvcreate -L 1.5G -n lv_workareas vg_datos /dev/sdc2
sudo lvcreate -L 5M -n lv_docker vg_datos /dev/sdc1
lsblk
sudo lvcreate -L 512M -n lv_swap vg_temp
sudo vgcreate vg_temp /dev/sdd1
sudo lvcreate -L 512M -n lv_swap vg_temp
sudo fdisk /dev/sdd
sudo vgcreate vg_temp /dev/sdd1
sudo lvcreate -L 512M -n lv_swap vg_temp
lsblk
sudo mkswap /dev/vg_temp/lv_swap
lsblk
sudo swapon --show
lsblk
sudo vim /etc/fstab
sudo swapon -a
lsblk
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mkdir -p /var/lib/docker
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mkdir -p /work
sudo mount /dev/vg_datos/lv_workareas /work
vim /etc/fstab
sudo vim /etc/fstab
sudo swapon /dev/vg_temp/lv_swap
swapon --show
history
sudo swapoff /dev/mapper/vg_temp-lv_swap
sudo swapon /dev/vg_temp/lv_swap
sudo lvdisplay /dev/vg_temp/lv_swap
swapon --show
pwd
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl restart docker
sudo systemctl status docker
/usr/local/bin/mirabelliAltaUser-Groups.sh
vim /usr/local/bin/mirabelliAltaUser-Groups.sh
sudo vim /usr/local/bin/mirabelliAltaUser-Groups.sh
ls -la
cd UTN-FRA_SO_Examenes/
ls -la
pwd
sudo vim /usr/local/bin/mirabelliAltaUser-Groups.sh
cd 202406
ls -la
cd bash_script/
ls -la
cat Lista_Usuarios.txt 
sudo vim /usr/local/bin/mirabelliAltaUser-Groups.sh
sudo chmod 755 /usr/local/bin/mirabelliAltaUser-Groups.sh
ls -l /usr/local/bin/mirabelliAltaUser-Groups.sh
/usr/local/bin/mirabelliAltaUser-Groups.sh
/usr/local/bin/mirabelliAltaUser-Groups.sh <Usuario> /home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
/usr/local/bin/mirabelliAltaUser-Groups.sh vagrant /home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
sudo /usr/local/bin/mirabelliAltaUser-Groups.sh vagrant /home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
id 2P_202406_Prog1
cd ..
ls -la
cd docker/
ls -la
vim index.html 
nginx -v
sudo apt update
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
systemctl status nginx
sudo vim Dockerfile
ls -la
docker build -t web1-mirabelli .
groups vagrant
sudo usermod -aG docker vagrant
groups vagrant
exit
groups vagrant
docker build -t web1-mirabelli .
cd UTN-FRA_SO_Examenes/202406/docker/
ls -la
docker build -t web1-mirabelli .
sudo cat /etc/docker/daemon.json
ls -l /var/lib/docker
sudo ls -l /var/lib/docker
lsblk
df -h /var/lib/docker
sudo systemctl stop docker
sudo mkdir -p /mnt/docker
sudo mv /var/lib/docker/* /mnt/docker/
docker info | grep "Docker Root Dir"
sudo ln -s /mnt/docker /var/lib/docker
docker info
sudo chown -R root:root /mnt/docker
sudo chmod -R 755 /mnt/docker
sudo systemctl stop docker
sudo ln -s /mnt/docker /var/lib/docker
sudo systemctl start docker
docker info
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl status docker
sudo systemctl status docker.socket
sudo ln -s /mnt/docker /var/lib/docker
sudo rm -rf /var/lib/docker
sudo systemctl stop docker
ps aux | grep docker
mount | grep /var/lib/docker
sudo umount /var/lib/docker
sudo lsof +D /var/lib/docker
sudo vim /etc/docker/daemon.json
sudo systemctl start docker
docker build -t web1-mirabelli .
docker images
docker run -d --name web1-container -p 8080:80 web1-mirabelli
docker ps
vagrant ssh-config
ip a
docker ps
docker-compose.yml
history
sudo vim run.sh
chmod 755 run.sh
sudo chmod 755 run.sh
./run.sh
docker ps
docker exec -it nginx-container /bin/bash
docker login -u leomirabelli
docker tag web1-mirabelli leomirabelli/parcial2:latest
docker push web1-mirabelli leomirabelli/parcial2:latest
docker login
q
docker tag web1-mirabelli leomirabelli/parcial2:latest
+
docker tag web1-mirabelli leomirabelli/parcial2:latest
docker push leomirabelli/parcial2:latest
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
cd ansible
mkdir -p tmp/2do_parcial/{alumno,equipo}
ls -la
ifconfig
ssh vagrant@ip
cat playbook.yml 
cd roles
ls -ls
ls -la
cd 2do_parcial/
ls -la
cd ..
ls -la
cd tmp
ls -la
cd 2do_parcial/
ls -la
vim datos_alumno.txt
ls -la
mv datos_alumno.txt ./alumno/
ls -la
ip addr show
cd ..
ld -ls
ls -la
cd ..
ls -la
ansible-playbook -i inventory playbook.yml
apt install ansible
sudo apt install ansible
ansible-playbook -i inventory playbook.yml
localhost ansible_connection=local
vim localhost
127.0.0.1 ansible_user=vagrant ansible_connection=ssh ansible_ssh_private_key_file=~/.vagrant.d/insecure_private_key
vim playbook.yml 
cd ..
ls -la
cd docker
ls -la
sudo vim run.sh
./run.sh 
cd ..
ls -la
cd RTA_Examen_20241116/
ls -la
vim Punto_A.sh
vim Punto_B.sh 
vim Punto_C.sh 
cd ..
ls -la
cd UTN-FRA_SO_Examenes/
ls -la
mv 202406 ../
ls -la
cd ..
ls -la
vim .bash_history 
git init
ls -la
git add .
git status
git reset
git status
