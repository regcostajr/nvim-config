return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        lazy = false,
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    "goimports",
                    "delve",
                }
            }
        end
    }
}
