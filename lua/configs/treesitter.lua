require("nvim-treesitter.configs").setup({
  ensure_installed = {"lua", "vim", "javascript", "typescript", "json", "json5", "regex", "scss", "css", "toml", "yaml" },
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
})

