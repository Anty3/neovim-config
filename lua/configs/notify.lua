local nvim_notify = require("notify")
nvim_notify.setup({
  stages = "slide",
  timeout = 1500,
  background_colour = "#2E3440",
})

vim.notify = nvim_notify
