return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				cs = { "csharpier" },
				css = { "prettier" },
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "black" },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
			},
			formatters = {
				csharpier = function()
					local useDotnet = not vim.fn.executable("csharpier")
					local command = useDotnet and "dotnet csharpier" or "csharpier"
					local version_out = vim.fn.system(command .. " --version")

					--NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
					local _ = version_out[#version_out]
					local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
					local is_new = major_version >= 1
					local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

					return {
						command = command,
						args = args,
						stdin = not is_new,
						require_cwd = false,
					}
				end,
			},
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>f",
			function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 5000,
				})
			end
		)
	end,
}
