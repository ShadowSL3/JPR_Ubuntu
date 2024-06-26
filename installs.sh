#!/bin/bash

# Install Ubuntu
sudo apt update && sudo apt full-upgrade -y

# Install development tools
sudo apt install build-essential git curl wget libssl-dev libbz2-dev libreadline-dev libsqlite3-dev -y

# Install Node.js for TypeScript language server
sudo apt install nodejs -y
npm i -g typescript-language-server

# Install Neovim
sudo apt install neovim -y

# Install Packer package manager for Neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Nvchad
git clone https://github.com/nvchad/nvchad ~/.config/nvchad

# Install necessary packages for Nvchad
sudo apt install cmake libssl-dev libbz2-dev libreadline-dev libsqlite3-dev -y
pip3 install pynvim clang python3-clang

# Install Telescope
git clone https://github.com/nvim-telescope/telescope.nvim ~/.config/nvchad/lua/plugins/telescope

# Install mason for LSP support
git clone https://github.com/williamboman/mason.nvim ~/.config/nvchad/lua/plugins/mason
git clone https://github.com/williamboman/mason-lspconfig.nvim ~/.config/nvchad/lua/plugins/mason-lspconfig

# Install treesitter for syntax highlighting
git clone https://github.com/nvim-treesitter/nvim-treesitter ~/.config/nvchad/lua/plugins/treesitter

# Install prettier for code formatting
npm i -g prettier

# Install gitsigns for git decorations
git clone https://github.com/lewis6991/gitsigns.nvim ~/.config/nvchad/lua/plugins/gitsigns

# Configure Neovim
echo "require('plugins')" >> ~/.config/nvchad/init.lua
echo "require('settings')" >> ~/.config/nvchad/init.lua

# Create a basic configuration for Neovim
cat << EOF > ~/.config/nvchad/lua/plugins.lua
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvchad/nvchad'
  use 'nvim-telescope/telescope.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'lewis6991/gitsigns.nvim'
end)
EOF

cat << EOF > ~/.config/nvchad/lua/settings.lua
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
EOF