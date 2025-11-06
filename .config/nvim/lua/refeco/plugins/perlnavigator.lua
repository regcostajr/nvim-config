local home = os.getenv("HOME")
local cwd = vim.fn.getcwd()

local tidy = "/.perltidyrc"
local critic = "/.perlcriticrc"

local use_tidy = home .. tidy
local use_critic = home .. critic

if vim.fn.filereadable(cwd .. tidy) == 1 then
    use_tidy = cwd .. tidy
end

if vim.fn.filereadable(cwd .. critic) == 1 then
    use_critic = cwd .. critic
end

return {
    'bscan/PerlNavigator',
    config = function()
        vim.lsp.config('perlnavigator', {
            settings = {
                perlnavigator = {
                    perlPath = 'perl',
                    enableWarnings = true,
                    perltidyProfile = use_tidy,
                    perlcriticProfile = use_critic,
                    perlcriticEnabled = true,
                }
            }
        })
    end
}
