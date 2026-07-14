return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle("diagnostics")
            end)

            vim.keymap.set("n", "[t", function()
                require("trouble").next("diagnostics");
            end)

            vim.keymap.set("n", "]t", function()
                require("trouble").prev("diagnostics");
            end)

        end
    },
}
