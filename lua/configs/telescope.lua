require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "%.git", "cache", "node_modules" },
    path_display = { "truncate" },
     mappings = {
        n = {
          ["o"] = "select_default"
        }
      }
  },
})
