# .files

## nvim

### requirements:
 - nodejs/npm (perlnavigator)
 - ripgrep (telescope)
 - nvim 0.9.0
 
```
git clone git@github.com:regcostajr/nvim-config.git &&\
cd nvim-config &&\
mkdir -p ~/.config &&\
cp -Rf .config/nvim ~/.config/nvim &&\
nvim --headless "+Lazy! sync" +qa
```
