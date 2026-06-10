return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()


        -- C / C++
        lspconfig.clangd.setup({ capabilities = capabilities })

        -- Rust
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                    checkOnSave = { command = "clippy"},
                },
                },
            })
        -- Lua
        lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
        Lua = {
        diagnostics = {
        globals = { "vim" },
        },
        },
        },
        })
            -- Keybindings, active only when an LSP attaches
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buff }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K",vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    }
