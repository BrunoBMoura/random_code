if [ $# -eq 2 ] 
then
    user_name=$1
    repo_name=$2
    echo -e "Repository \e[92m$user_name/$repo_name \e[39mwill be created."
    repo_data="{\"name\":\""$repo_name"\"}"
    curl -u $user_name https://api.github.com/user/repos -d $repo_data
    mkdir $repo_name
    cd $repo_name
    echo "Starting local respository as git."
    git init
    echo "Initial readme." >> README.md
    git add README.md
    git commit -m "Created repository."
    echo "Adding initial files to repository."
    git remote add origin git@github.com:$user_name/$repo_name.git
    echo "Pushing repository data."
    git push -u origin master
    echo -e "\e[92mRepository ready!"
else
    echo "First arg: github username, second arg: repository name."
fi
