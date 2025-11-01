local M = {}
local lsp = vim.lsp

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local lspconfig = require("lspconfig")

-- list of all servers configured.
-- lspconfig.servers = {
--     "lua_ls",
--     -- "clangd",
-- --     "gopls",
--     -- "hls",
--     -- "ols",
--     "pyright",
--     "ruff",
--     "cssls",
--     "html",
--     "bashls",
--     "fish_lsp",
--     "dockerls",
--     "docker_compose_language_service",
--     "docker_language_server",
--     "jsonls",
-- }

-- Configure servers
M.setup = function()
    -- Configure each server
    local servers = {
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        enable = false,
                    },
                    workspace = {
                        library = {
                            vim.fn.expand("$VIMRUNTIME/lua"),
                            vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                            vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                            vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                            "${3rd}/love2d/library",
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        },
        pyright = {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        },
    }

    local default_servers = {
        "ruff",
        -- "ols",
        -- "pyright",
    }
    -- Setup each server
    for server, config in pairs(servers) do
        config.on_attach = on_attach
        config.on_init = on_init
        config.capabilities = capabilities
        
        require("lspconfig")[server].setup(config)
    end
end

-- list of servers configured with default config.
-- local default_servers = {
--     -- "ols",
--     -- "pyright",
--     "ruff",
-- }

-- lsps with default config
-- for _, lsp in ipairs(default_servers) do
--     lspconfig[lsp].setup({
--         on_attach = on_attach,
--         on_init = on_init,
--         capabilities = capabilities,
--     })
-- end

-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })

-- lspconfig.hls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.lua_ls.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,

--     settings = {
--         Lua = {
--             diagnostics = {
--                 enable = false, -- Disable all diagnostics from lua_ls
--                 -- globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     vim.fn.expand("$VIMRUNTIME/lua"),
--                     vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
--                     vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
--                     vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
--                     "${3rd}/love2d/library",
--                 },
--                 maxPreload = 100000,
--                 preloadFileSize = 10000,
--             },
--         },
--     },
-- })

-- lspconfig.pyright.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,

--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "off", -- Disable type checking diagnostics
--             },
--         },
--     },
-- })
