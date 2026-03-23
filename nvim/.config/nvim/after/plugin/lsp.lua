vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    -- Navigation
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- go to definition
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) -- find references
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- go to implementation

    -- Info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show docs
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- function signature

    -- Actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- rename symbol
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code actions

    -- Diagnostics
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show error
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- prev error
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- next error

    -- Formatting
    vim.keymap.set("n", "<leader>fo", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
