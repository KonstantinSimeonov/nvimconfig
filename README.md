```bash
# neovim
git clone --recurse-submodules https://github.com/KonstantinSimeonov/nvimconfig.git ~/.config/nvim

### Typescript support via [coc-tsserver](https://github.com/neoclide/coc-tsserver)
Nodejs binary must be available in path.

```bash
# installing
nvim -c 'CocInstall coc-tsserver coc-eslint coc-tailwind-intellisense coc-css coc-json coc-sh coc-rust-analyzer'
```

### Updating
```bash
./update-plugins.sh
```
