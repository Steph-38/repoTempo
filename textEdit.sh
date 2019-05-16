clear
if [ ! -f "./base" ] 
then
    echo "The slow brown unicorn jumped over the hyper sleeping dog" > base
fi

cat base
echo ""
echo "Changer le mot :"
read from
echo ""
echo "En :"
read to 
echo ""
sed s/$from/$to/ < base > edited
rm base 
mv edited base
cat base
