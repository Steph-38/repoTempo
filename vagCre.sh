# 1ère étape : on demande le nom du dossier
echo "Entrer le nom du dossier Data :"
read data
clear
echo "========================"
echo "Vagrant Creator"
echo "========================"
echo ""
printf 'Installation de la VM, Merci de patienter...'
echo ""
echo ""

# création automatique d'un dossier repVagrant
mkdir repVagrant
cd repVagrant

# création du fichier Vagrantfile avec la variable $data
echo "Vagrant.configure('2') do |config|
config.vm.box = 'ubuntu/xenial64'
config.vm.network 'private_network', ip: '192.168.33.10'
config.vm.synced_folder './$data', '/var/www/html'
end
" > Vagrantfile

# création du dossier synchronisé avec la Vagrant
mkdir $data
vagrant up > /dev/null

echo "
clear
echo '========================'
echo 'Vagrant Creator'
echo '========================'
echo ''
printf 'Configuration de la VM...'

# Exécution silencieuse ...
exec > /dev/null 2>&1
cd /var/www/html

# Mise à jour du cache et installation des paquets
sudo apt update 

sudo apt install apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 zip php7.0-zip -y 

sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password 0000'

sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password 0000'
 
sudo apt-get install -y mysql-server 

# Génération du code dans le dossier synchronisé 
">./$data/sc2.sh 

# connexion à la Vagrant et lancement du script
vagrant ssh -- -t 'bash /var/www/html/sc2.sh'

# arrêt du scrip
vagrant halt > /dev/null

clear
echo "========================"
echo "Vagrant Creator"
echo "========================"
echo ""
echo "installation terminée"