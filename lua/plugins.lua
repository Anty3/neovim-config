local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer if not installed
if fn.glob(packer_install_dir) == "" then
	vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
	vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require("packer.util")

require("packer").startup(function(use)
	use({ "lewis6991/impatient.nvim", config = [[require('impatient')]] })
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "goolord/alpha-nvim", event = "VimEnter", config = [[require('configs.alpha')]] })

	use({
		"rcarriga/nvim-notify",
		config = [[require('configs.notify')]],
	})

	use({ "onsails/lspkind-nvim" })
	use({ "SirVer/ultisnips" })

	-- auto-completion enginp
	use({ "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('configs.cmp')]] })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } })
	-- use { "hrsh7th/cmp-omni", after = "nvim-cmp" }

	use({ "williamboman/nvim-lsp-installer" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({
		"neovim/nvim-lspconfig",
		after = { "cmp-nvim-lsp", "nvim-lsp-installer", "null-ls.nvim" },
		config = [[require('configs.lsp')]],
	})
	use({ "nvim-treesitter/nvim-treesitter", config = [[require('configs.treesitter')]] })

	use({ "Raimondi/delimitMate" })

	use({
		"phaazon/hop.nvim",
		config = [[require('configs.hop')]],
	})

	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = [[require('configs.telescope')]],
	})

	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	--  use({
	--    "karb94/neoscroll.nvim",
	--    config = [[require('configs.neoscroll')]]
	--  })

	use({ "gelguy/wilder.nvim", config = [[require('configs.wilder')]] })

	use({
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	})

	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "numToStr/Comment.nvim", after = "nvim-ts-context-commentstring", config = [[require('configs.commenter')]] })

	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	use({ "famiu/bufdelete.nvim" })

	-- use({
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		{
	-- 			-- only needed if you want to use the commands with "_with_window_picker" suffix
	-- 			"s1n7ax/nvim-window-picker",
	-- 			tag = "1.*",
	-- 			config = function()
	-- 				require("window-picker").setup({
	-- 					autoselect_one = true,
	-- 					include_current = false,
	-- 					filter_rules = {
	-- 						-- filter using buffer options
	-- 						bo = {
	-- 							-- if the file type is one of following, the window will be ignored
	-- 							filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
	--
	-- 							-- if the buffer type is one of following, the window will be ignored
	-- 							buftype = { "terminal" },
	-- 						},
	-- 					},
	-- 					other_win_hl_color = "#e35e4f",
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = [[require("configs.neo-tree")]],
	-- })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = [[require('configs.nvim-tree')]],
	})

	-- use({ "voldikss/vim-floaterm" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress" },
		config = [[require('configs.lualine')]],
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "v1.*",
		config = [[require('configs.toggleterm')]]
	})
end)
