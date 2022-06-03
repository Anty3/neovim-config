local cmd = vim.cmd
local indent = 2

local options = {
  clipboard = "unnamedplus",
  encoding = "utf-8",
  hlsearch = false,
  incsearch = true,
  hidden = true,
  swapfile = false,
  backup = false,
  errorbells = false,
  termguicolors = true,
  scrolloff = 8,
  splitright = true,
  splitbelow = true,
  mouse = "a",
  lazyredraw = true,
  cmdheight = 1,
  updatetime = 50,
  completeopt = { "menuone", "noselect" },
  timeoutlen = 250,
  ttimeoutlen = 5,
  fileencoding = "utf-8",
  expandtab = true,
  tabstop = indent,
  softtabstop = indent,
  shiftwidth = indent,
  smartindent = true,
  signcolumn = "yes",
  wrap = false,
  number = true,
  shortmess = vim.opt.shortmess:append"c"
}


for key, value in pairs(options) do
  vim.opt[key] = value
end
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")
