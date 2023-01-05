# https://gist.github.com/skjohansen/01a4bc472eff47422e964919a3c3dbb2
GISTID='01a4bc472eff47422e964919a3c3dbb2'
GISTREV='f7ffc757054e32f3fc1ee395d546c630ba4abbc5'
#echo $GISTID
wget -O ../_posts/2023-01-03-cake_and_docker.md 'https://gist.githubusercontent.com/skjohansen/'$GISTID'/raw/'$GISTREV'/readme.md'
CURRENT_DATE=$(date +"%Y-%m-%dT%T")
sed -i '2 i gist-sync: '$CURRENT_DATE ../_posts/2023-01-03-cake_and_docker.md
sed -i '3 i gist-link: https://gist.github.com/skjohansen/'$GISTID ../_posts/2023-01-03-cake_and_docker.md
sed -i '4 i repo-link: https://github.com/skjohansen/example-cake_and_docker' ../_posts/2023-01-03-cake_and_docker.md

wget -N -P ../img/posts/ https://gist.githubusercontent.com/skjohansen/$GISTID/raw/$GISTREV/image-20230104170415458.png