local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	" ██████   █████    ███████    ██████████ █████   █████ █████ ██████   ██████ ",
	" ░██████ ░░███   ███░░░░░███ ░░███░░░░░█░░███   ░░███ ░░███ ░░██████ ██████  ",
	" ░███░███ ░███  ███     ░░███ ░███  █ ░  ░███    ░███  ░███  ░███░█████░███  ",
	" ░███░░███░███ ░███      ░███ ░██████    ░███    ░███  ░███  ░███░░███ ░███  ",
	" ░███ ░░██████ ░███      ░███ ░███░░█    ░░███   ███   ░███  ░███ ░░░  ░███  ",
	" ░███  ░░█████ ░░███     ███  ░███ ░   █  ░░░█████░    ░███  ░███      ░███  ",
	" █████  ░░█████ ░░░███████░   ██████████    ░░███      █████ █████     █████ ",
	" ░░░░    ░░░░░    ░░░░░░░    ░░░░░░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░  ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("Leader f", "  > Find file", ":Telescope find_files hidden=true<CR>"),
	dashboard.button("Leader g", "  > Project grep", ":Telescope live_grep<CR>"),
	dashboard.button("Leader b", "  > Find buffer", ":Telescope buffers<CR>"),
	dashboard.button("u", "  > Update plugins", ":PackerSync<CR>"),
	dashboard.button("e", "  > New file", ":enew <CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

-- Send config to alpha
alpha.setup(dashboard.opts)
