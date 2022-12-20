vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
local setup_servers = function()
  vim.tbl_map(astronvim.lsp.setup, astronvim.user_plugin_opts "lsp.servers")
  vim.cmd "silent! do FileType"
end
if astronvim.is_available "mason-lspconfig.nvim" then
  vim.api.nvim_create_autocmd("User", { pattern = "AstroLspSetup", once = true, callback = setup_servers })
else
  setup_servers()
end

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end

local protocol = require "vim.lsp.protocol"

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end,
    })
  end
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}
