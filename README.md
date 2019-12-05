```bash
# neovim
git clone --recurse-submodules https://github.com/KonstantinSimeonov/nvimconfig.git ~/.config/nvim

# vim
git clone --recurse-submodules https://github.com/KonstantinSimeonov/nvimconfig.git ~/.vim
ln -s ~/.vim/init.vim ~/.vimrc
```

### Typescript support via [coc-tsserver](https://github.com/neoclide/coc-tsserver)
Nodejs binary must be available in path.

```
# once (n)vim is open
:CoCInstall coc-tsserver
```

### Scala support via [metals](https://scalameta.org/metals/docs/editors/vim.html#generating-metals-binary)
Obviously required scala/java executables in path.
