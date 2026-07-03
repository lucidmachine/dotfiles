return {
    { "shaunsingh/nord.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
        init = function()
            vim.g.nord_borders = true
            vim.g.nord_italic = false
        end,
    },
}
