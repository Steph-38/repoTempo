git init
git add --all
git commit -m "first commit"
clear
echo "Insérer l'URL du Repo ici :"
read theUrl
git remote add origin $theUrl
git push -u origin master