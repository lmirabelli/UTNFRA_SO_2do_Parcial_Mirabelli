#crear Particiones

sudo fdisk /dev/sdc1 lv_docker
sudo fdisk /dev/sdc2 lv_workareas
sudo fdisk /dev/sdd1 lv_swap

#inicializar volumenes fisicos

sudo pvcreate /dev/sdc1 /dev/sdc2 /dev/sdd1

#crear grupos de volumenes

sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2
sudo vgcreate vg_temp /dev/sdd1

#crear volumenes logicos

sudo lvcreate -L 5M -n lv_docker vg_datos /dev/sdc1
sudo lvcreate -L 1.5G -n lv_workareas vg_datos /dev/sdc2
sudo lvcreate -L 512M -n lv_swap vg_temp /dev/sdd1

#formatear swap

sudo mkswap /dev/vg_temp/lv_swap

#desde vim para que sea permanente

/dev/vg_temp/lv_swap none swap sw 0 0

sudo swapon -a

#formatear volumnes logicos

sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas

#montar volumenes logicos

sudo mkdir -p /var/lib/docker
sudo mkdir -p /work

sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work

#desde vim para que sea permanente

/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0
/dev/vg_datos/lv_workareas /work ext4 defaults 0 0

