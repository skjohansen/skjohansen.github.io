# https://gist.github.com/skjohansen/01a4bc472eff47422e964919a3c3dbb2
wget -O _posts/2023-01-03-cake_and_docker.md https://gist.githubusercontent.com/skjohansen/01a4bc472eff47422e964919a3c3dbb2/raw/cd331b0c7525ff1e649438bb1d9cc83fc9ee9d02/readme.md
CURRENT_DATE=$(date +"%Y-%m-%dT%T")
sed -i '1s/^/<!-- fetch form gist '$CURRENT_DATE'-->\n/' _posts/2023-01-03-cake_and_docker.md