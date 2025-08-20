# .files

## nvim

### requirements:
 - nodejs/npm (perlnavigator)
 - ripgrep (telescope)
 - nvim 0.9.0
 
```
git clone git@github.com:regcostajr/.files.git &&\
cd .files &&\
mkdir -p ~/.config &&\
cp -Rf .config/nvim ~/.config/nvim &&\
nvim --headless "+Lazy! sync" +qa
```
