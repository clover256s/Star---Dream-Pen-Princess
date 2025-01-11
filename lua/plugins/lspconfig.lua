return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_servers = {
			"clangd",
			"cmake",
			"rust_analyzer",
			"bashls",
			"cssls",
			"html",
			"jsonls",
			"lua_ls",
			"ts_ls",
		}

		for _, lsp in ipairs(lsp_servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end

		local opts = { buffer = bufnr, noremap = true, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k >", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = {
				source = "always",
			},
		})
	end,
}
