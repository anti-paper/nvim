local on_attach = function(client, bufnr)
    -- LSPが持つフォーマット機能を無効化する
    -- →例えばtsserverはデフォルトでフォーマット機能を提供しますが、利用したくない場合はコメントアウトを解除してください
    client.server_capabilities.documentFormattingProvider = false

    -- 下記ではデフォルトのキーバインドを設定しています
    -- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります

    local set = vim.keymap.set
    set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    set("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")

    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
    set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
end

-- 補完プラグインであるcmp-nvim-lspをLSPと連携させています（後述）
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- (2022/11/1追記):cmp-nvim-lspに破壊的変更が加えられ、
-- local capabilities = require('cmp-nvim-lsp').update_capabilities(
--  vim.lsp.protocol.make_client_capabilities()
-- )
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- ⇑上記のupdate_capabilities(...)の関数は非推奨となり、代わりにdefault_capabilities()関数が採用されました。日本語情報が少ないため、念の為併記してメモしておきます。

-- この一連の記述で、mason.nvimでインストールしたLanguage Serverが自動的に個別にセットアップされ、利用可能になります
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function(server_name)                -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,       --keyバインドなどの設定を登録
            capabilities = capabilities, --cmpを連携
        }
    end,
}

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.prettier,
    }
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
        vim.lsp.buf.format({
            async = false,
            filter = function (client)
                return client.name ~= 'intelephense'
            end,
        })
    end,
})
