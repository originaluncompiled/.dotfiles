return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy", -- or lazy-load on BufReadPost
    opts = {
        enable = true,
        max_lines = 5, --(0 = unlimited)
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "inner", --  "outer" | "inner"
        mode = "cursor",  -- "cursor" | "topline" - cursor is usually more useful
        separator = nil,  -- e.g. "─" if you want a divider line
        zindex = 20,
    },
}
