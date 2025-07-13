return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        event = "VeryLazy",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on theme
        keys = {
            { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
            { "<leader>cC", "<cmd>CopilotChatClear<cr>", desc = "Copilot Chat Clear" },
            { "<leader>cR", "<cmd>CopilotChatRefresh<cr>", desc = "Copilot Chat Refresh" },
            { "<leader>cS", "<cmd>CopilotChatSettings<cr>", desc = "Copilot Chat Settings" },
            { "<leader>cA", "<cmd>CopilotChatAddToContext<cr>", desc = "Copilot Chat Add to Context" },
            { "<leader>cD", "<cmd>CopilotChatDeleteFromContext<cr>", desc = "Copilot Chat Delete from Context" },
            { "<leader>ce", ":CopilotChatExplain<cr>", desc = "Explain Code" },
            { "<leader>cr", ":CopilotChatReview<cr>", desc = "Review Code" },
            { "<leader>cf", ":CopilotChatFix<cr>", desc = "Fix Code Issue" },
            { "<leader>co", ":CopilotChatOptimize<cr>", desc = "Code Optimize" },
            { "<leader>cO", ":CopilotChatOptimizeAll<cr>", desc = "Code Optimize All" },
            { "<leader>cT", ":CopilotChatTests<cr>", desc = "Generate Test Code" },
            { "<leader>cC", ":CopilotChatContext<cr>", desc = "Copilot Chat Context" },
        },
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        config = function()
            -- Optional:
            -- Example:
            vim.g.VM_leader = "<space>" -- Change the leader key
            vim.g.VM_default_mappings = 1 -- Enable deafult mappings
        end,
    },
}
