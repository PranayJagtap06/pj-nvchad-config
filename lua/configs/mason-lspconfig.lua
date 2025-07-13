-- import mason-lspconfig plugin safely
local mason_lspconfig = require("mason-lspconfig")

-- list of servers for mason to install
local servers = {
	"lua_ls",
	"pyright",
	"ruff_lsp",
	"black",
	"isort",
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"prettier",
	"tailwindcss",
	"yamlls",
}

-- setup mason-lspconfig
mason_lspconfig.setup({
	ensure_installed = servers,
})
