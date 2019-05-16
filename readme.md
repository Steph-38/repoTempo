

Évidemment, vous devrez réaliser un fichier readme.md en expliquant à quoi servent chaque script et quelles difficultés vous avez rencontré.

SCRIPT vagCre.sh
1 : Ce script demande en premier de nommer le dossier qui sera récupéré dans une variable $data.
2 : Création automatique d'un dossier repVagrant dans lequel on se déplace
3 : Création du fichier Vagrantfile avec les paramètres associés, ainsi que du dossier data (réutilisation de la variable $data dans les deux cas)
4 : Lancement du vagrant up, mise à jour du cache et installation des paquets nécessaires (le tout ne sera pas affiché => "Exécution silencieuse")
5 : lancement du vagrant ssh et fin du script

SCRIPT setGit.sh
1 : Ce script va initialisé le répertoire courant en repository local
2 : Ajout automatique de tous les fichiers et dossiers dans ce repository (sauf les cachés), suivi du commit qui valide cet ajout.
3 : Saisie de l'url qui servira à créer le remote du repository
4 : Push du repository local vers le repository distant

SCRIPT originScript.sh
Jeu du Mastermind
A chaque début de partie, une combinaison secrète et aléatoire de 4 chiffres est générée dans 4 variables ($comb1, ... , $comb4).
Le but est de trouver la combinaison gagnante en - de 12 tours.
Comme dans le jeu original du mastermind, un code couleur est là pour aider :
vert : chiffre trouvé au bon endroit
jaune : chiffre présent dans la combinaison mais pas à la bonne place
rouge : chiffre non présent dans la combinaison

