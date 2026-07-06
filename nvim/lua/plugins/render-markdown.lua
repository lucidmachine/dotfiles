return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            heading = { width = "block" },
            dash = { width = 100 },
            checkbox = {
                enabled = true,
                checked = { icon = "󰄲 " },
                custom = {
                    intermediate_small = {
                        raw = "[.]",
                        rendered = "󰡖 ",
                        highlight = "RenderMarkdownTodo",
                    },
                    intermediate_large = {
                        raw = "[o]",
                        rendered = "󰄮 ",
                        highlight = "RenderMarkdownTodo",
                    },
                },
            },
        },
    },
}
