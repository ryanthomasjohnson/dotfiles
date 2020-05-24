set -x
git submodule update --init --recursive --depth 1
for file in $(ls -A home)
do
    ln -sf $(realpath home/$file) ~/$file
done

( cd home/.vim/bundle/YouCompleteMe && python install.py --clang-completer )

