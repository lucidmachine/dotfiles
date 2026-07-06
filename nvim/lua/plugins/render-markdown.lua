return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            heading = { width = "block" },
            dash = { width = 100 },
            checkbox = {
                enabled = true,
                custom = {
                    intermediate = {
                        raw = "[.]",
                        rendered = "󰡖 ",
                        highlight = "RenderMarkdownTodo",
                    },
                },
            },
        },
    },
}
