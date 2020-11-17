set -x
git submodule update --init --recursive --depth 1
for file in $(ls -A home)
do
    ln -sf $(realpath home/$file) ~/$file
done

mkdir -p ~/.config
for entry in $(ls -A config)
do
    ln -sf $(realpath config/$entry) ~/.config/$entry
done
vim +PlugInstall +qall
vim +'CocInstall coc-clangd' +qall
