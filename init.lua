vim.cmd[[
  augroup packer_auto_compile
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
  augroup END
]]

vim.g.mapleader = " "
require('options')
require('maps')
require('plugins')


