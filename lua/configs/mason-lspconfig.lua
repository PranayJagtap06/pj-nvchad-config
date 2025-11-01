-- deprecated API
-- local lspconfig = require("lspconfig")

-- -- List of servers to ignore during install
-- local ignore_install = {}

-- -- Helper function to find if value is in table.
-- local function table_contains(table, value)
--     for _, v in ipairs(table) do
--         if v == value then
--             return true
--         end
--     end
--     return false
-- end

-- -- Build a list of lsp servers to install minus the ignored list.
-- local all_servers = {}
-- for _, s in ipairs(lspconfig.servers) do
--     if not table_contains(ignore_install, s) then
--         table.insert(all_servers, s)
--     end
-- end

-- require("mason-lspconfig").setup({
--     ensure_installed = all_servers,
--     automatic_installation = false,
--     handlers = {
--         -- Default handler
--         function(server_name)
--             require("lspconfig")[server_name].setup({})
--         end,
--     }
-- })


local lsp = vim.lsp

-- List of servers to ignore during install
local ignore_install = {}

-- Helper function to find if value is in table.
local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- List of LSP servers to configure
local servers = {
    "lua_ls",
    "pyright",
    "ruff",
    "cssls",
    "html",
    "bashls",
    "fish_lsp",
    "dockerls",
    "docker_compose_language_service",
    "docker_language_server",
    "jsonls",
}

-- Build a list of lsp servers to install minus the ignored list.
local all_servers = {}
for _, s in ipairs(servers) do
    if not table_contains(ignore_install, s) then
        table.insert(all_servers, s)
    end
end

require("mason-lspconfig").setup({
    ensure_installed = all_servers,
    automatic_installation = false,
    handlers = {
        -- Default handler with new LSP config API
        function(server_name)
            local server = require("lspconfig")[server_name]
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- Default configuration
            local config = {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    -- Your on_attach function here
                    require("nvchad.configs.lspconfig").on_attach(client, bufnr)
                end,
            }

            -- Server-specific configurations can be added here
            if server_name == "lua_ls" then
                config.settings = {
                    Lua = {
                        diagnostics = {
                            enable = false,
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                }
            end

            -- Setup the server with config
            server.setup(config)
        end,
    }
})