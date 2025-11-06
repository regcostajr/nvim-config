local ensure_installed = require("refeco.utils.mason-ensure-installed")

return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Config
		"mason-org/mason.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = ensure_installed.lsp,
				automatic_installation = true,
			},
			config = function(_, opts)
				local msn = require("mason-lspconfig")
				msn.setup(opts)
			end,
		},
	},
	init = function()
		-- Reserve a space in the gutter
		-- This will avoid an annoying layout shift in the screen
		vim.opt.signcolumn = "yes"
	end,
	config = function(_, opts)
		local mason_registry = require("mason-registry")

		-- Mason plugins manual ensure installed
		for _, name in ipairs(ensure_installed.plugins) do
			local pkg = mason_registry.get_package(name)
			if not pkg:is_installed() then
				pkg:install()
			end
		end

		-- Capabilities
		local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			has_cmp and cmp_nvim_lsp.default_capabilities() or {},
			opts.capabilities or {}
		)

		local handlers = {}

		local servers = ensure_installed.lsp

		if #servers > 0 then
			for _, server in ipairs(servers) do
				local ok, custom_opts = pcall(require, "plugins.lsp.settings." .. server)
				local server_opts = vim.tbl_deep_extend(
					"force",
					{ handlers = handlers, capabilities = vim.deepcopy(capabilities) },
					ok and custom_opts or {}
				)

				vim.lsp.config[server] = server_opts
				vim.lsp.enable(vim.lsp.config[server])
			end
		end
	end,
}
