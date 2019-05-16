# Initialisation du repository local
git init

# Ajout des fichiers et dossiers
git add --all

# commit de l'ajout
git commit -m "first commit"
clear

# saisie de l'url pour ajouter comme remote
echo "Insérer l'URL du Repo ici :"
read theUrl
git remote add origin $theUrl

# Push du repository local vers le repository distant
git push -u origin master