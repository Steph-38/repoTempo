#Déclaration des couleurs afin de faire un truc cali

NC='\033[0m' #No color

GREEN='\033[0;32m' #Green
YELLOW='\033[0;33m' #Yellow
RED='\033[0;31m' #Red

PURPLE='\033[0;35m' #Purple

#${color}

nbTours=12
nbCombi=4
clear
echo -e "Bienvenue dans le ${PURPLE}Mastermind${NC}.

Le principe est simple, a chaque début de partie, une combinaison secrète et aléatoire de $nbCombi chiffres va être générée.
Tu dispose de $nbTours essais pour la déduire.

Biensûr, nous allons te filer un coup de main par le biais d'indication donc enregistre bien :

Si ton chiffre est ${GREEN}vert${NC} : C'est un chiffre que tu as déduis, gg à toi.
Si ton chiffre est ${YELLOW}jaune${NC} : Il est bien dans cette combinaison, mais pas au bon endroit.
Si ton chiffre est ${RED}rouge${NC} : Il n'est pas présent dans cette combinaison.

A tout moment, tu peut écrire 'exit' pour quitter le jeu ou 'reset' pour le redémarrer.


Bon chance. (Appuyez sur Entrer pour démarrer.)"
read f
clear
game="running"
lap=0
historique=""
#echo $game
while [ $game = "running" ]
do
    if [ $lap -lt 1 ]
    then 
    #0 = pas trouvé  1 = Mauvaise position  2 = trouvé.
    #echo "start"
     comb1=$(($RANDOM%10))
     #echo $comb1
     stateComb1="0"
     comb2=$(($RANDOM%10))
     #echo $comb2
     stateComb2="0"
     comb3=$(($RANDOM%10))
     #echo $comb3
     stateComb3="0"
     comb4=$(($RANDOM%10))
     #echo $comb4
     stateComb4="0"
    fi 

    if [ $stateComb1 = 2 ] && [ $stateComb2 = 2 ] && [ $stateComb3 = 2 ] && [ $stateComb4 = 2 ]
    then
    clear
    echo -e $historique
    echo "
    Vous avez gagné !"
    break
    fi






    if [ $lap -ge 1 ] && [ $lap -le 12 ]
    then
    clear
    echo "
    Essais $lap/12.
    Input attendu : X X X X
    "
    echo -e $historique
    read f 


    if [ $f = "restart" ]
    then
    lap=0
    historique=""
    else

    etat="${RED}"
    #Je prend ma chaine $f puis la cut avec comme séparateur " ", en prend le premier résultat (-f1) et balance tout dans $chaine
    chaine="$(cut -d' ' -f1 <<<"$f")"
    echo $chaine
    if [ $chaine = $comb1 ]
    then
    stateComb1=2
    etat="${GREEN}"
    else
        if [ $chaine = $comb2 ]
        then
        stateComb2=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb3 ]
        then
        stateComb3=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb4 ]
        then
        stateComb4=1
        etat="${YELLOW}"
        fi
    fi
    historique="$historique$etat$chaine${NC}"


    etat="${RED}"
    chaine="$(cut -d' ' -f2 <<<"$f")"
    echo $chaine
    if [ $chaine = $comb2 ]
    then
    stateComb2=2
    etat="${GREEN}"
    else
        if [ $chaine = $comb1 ]
        then
        stateComb1=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb3 ]
        then
        stateComb3=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb4 ]
        then
        stateComb4=1
        etat="${YELLOW}"
        fi
    fi
    historique="$historique $etat$chaine${NC}"


    etat="${RED}"
    chaine="$(cut -d' ' -f3 <<<"$f")"
    echo $chaine
    if [ $chaine = $comb3 ]
    then
    stateComb3=2
    etat="${GREEN}"
    else
        if [ $chaine = $comb2 ]
        then
        stateComb2=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb1 ]
        then
        stateComb1=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb4 ]
        then
        stateComb4=1
        etat="${YELLOW}"
        fi
    fi
    historique="$historique $etat$chaine${NC}"


    etat="${RED}"
    chaine="$(cut -d' ' -f4 <<<"$f")"
    echo $chaine
    if [ $chaine = $comb4 ]
    then
    stateComb4=2
    etat="${GREEN}"
    else
        if [ $chaine = $comb2 ]
        then
        stateComb2=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb3 ]
        then
        stateComb3=1
        etat="${YELLOW}"
        fi
        if [ $chaine = $comb1 ]
        then
        stateComb1=1
        etat="${YELLOW}"
        fi
    fi
    historique="$historique $etat$chaine${NC}\n"

    
    fi

    if [ $f = "exit" ]
    then
    break
    fi

    
    fi


    if [ $lap -gt 12 ]
    then 
     game="lost"
     clear
     echo "Fin de la partie."
    fi
    let lap++
done
