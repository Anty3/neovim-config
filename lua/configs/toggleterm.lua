require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "double",
		width = function()
			return math.ceil(vim.o.columns * 0.9)
		end,
		height = function()
			return math.ceil(vim.o.lines * 0.9)
		end,
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("close")
	end,
})

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

vim.keymap.set("n", "<M-g>", function()
	lazygit:toggle()
end, { noremap = true, silent = true })

vim.keymap.set("t", "<M-g>", function()
	lazygit:toggle()
end, { noremap = true, silent = true })
