return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                  file_ignore_patterns = { ".git/", ".gitignore$" },
            },
            pickers = {
                find_files = {
                    hidden = true
                }
            }
        })
    end
}
