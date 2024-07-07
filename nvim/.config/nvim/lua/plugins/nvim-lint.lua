return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            yaml = { "actionlint" },
        }

        require("lint").linters.actionlint.args = {
            "-config-file",
            ".github/actionlint.yaml",
            "-format",
            "{{json .}}",
            "-",
        }

        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
            group = vim.api.nvim_create_augroup("actionDiagnosticAuGroup", { clear = true }),
            pattern = { "**/.github/workflows/*.yml" },
            callback = function()
                local opts = { noremap = true, silent = true, buffer = true }
                vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
                vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
            end,
        })

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "BufNewFile" }, {
            group = vim.api.nvim_create_augroup("actionLintAuGroup", { clear = true }),
            pattern = { "**/.github/workflows/*.yml" },
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
