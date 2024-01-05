# Setup
- nvim installed
- nodejs binary in path
- [optional] rustc

```bash
git clone \
  --recurse-submodules \
  https://github.com/KonstantinSimeonov/nvimconfig.git \
  ~/.config/nvim

# build coc
node -v
cd $_/bundle/coc.nvim
npm i
npm run build

# install extensions
nvim -c 'CocInstall coc-tsserver coc-eslint coc-tailwind-intellisense coc-css coc-json coc-sh coc-rust-analyzer'
```

### Updating
```bash
./update-plugins.sh
```
