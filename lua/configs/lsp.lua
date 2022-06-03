local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

local servers = {
  "jsonls",
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "remark_ls",
  "sqlls",
  "tailwindcss",
  "vuels",
  "prismals",
}

lsp_installer.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local custom_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false

  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gs", function()
    vim.cmd('vsplit') vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gs", function()
    vim.cmd('vsplit') vim.lsp.buf.declaration()
  end, opts)

  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float(0, { scope = 'line', border = 'rounded' })
  end, opts)

  vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>q", function() vim.diagnostic.setqflist({open = true}) end, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "<leader>p", vim.lsp.buf.formatting, opts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer=bufnr,
    callback = function()
      local diagnostics_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',  -- show source in diagnostic popup window
        prefix = ' '
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2]) and
        #vim.diagnostic.get() > 0
      then
          vim.diagnostic.open_float(nil, diagnostics_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end
  })

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  if vim.g.logging_level == 'debug' then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, 'info', {title = 'Nvim-config'})
  end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local installed_servers = lsp_installer.get_installed_servers()
for _, server in pairs(installed_servers) do
  local options = {
    capabilities = capabilities,
    on_attach = custom_attach,
  }

  --if server.name == "jsonls" then
  --  local config = require("modules.lsp.configs.jsonls")
  --  if config ~= nil then
  --    options = vim.tbl_deep_extend("force", config, options)
  --  end
  -- end


  if server.name == 'sumneko_lua' then
    options.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } }
      }
    }
  end

  lspconfig[server.name].setup(options)
end


fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  severity_sort = true,
})

lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

require('configs.null-ls')
