return {
    "NickvanDyke/opencode.nvim",
    dependencies = {
        {
            "folke/snacks.nvim",
            opts = {
                input = {},
                picker = {},
                terminal = {},
            },
        },
    },
    config = function()
        local opencode_cmd = "opencode --port"
        local opencode_width = 69

        local function opencode_win()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_name(buf):match("opencode") then
                    return win
                end
            end
        end

        local function fix_opencode_win(win)
            if not win or not vim.api.nvim_win_is_valid(win) then
                return
            end

            vim.api.nvim_win_set_width(win, opencode_width)
            vim.wo[win].winfixwidth = true
            vim.wo[win].winbar = ""

            local buf = vim.api.nvim_win_get_buf(win)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {
                buffer = buf,
                desc = "Window command from opencode",
            })
        end

        local function open_opencode()
            local win = opencode_win()
            if win then
                fix_opencode_win(win)
                vim.api.nvim_set_current_win(win)
                return
            end

            vim.cmd("topleft vertical split term://" .. opencode_cmd .. " | vertical resize " .. opencode_width)
            fix_opencode_win(vim.api.nvim_get_current_win())
            vim.cmd("wincmd p")
        end

        local function close_opencode()
            local win = opencode_win()
            if win then
                vim.api.nvim_win_close(win, true)
            end
        end

        local function toggle_opencode()
            if opencode_win() then
                close_opencode()
            else
                open_opencode()
            end
        end

        vim.g.opencode_opts = {
            server = {
                start = open_opencode,
            },
            events = {
                permissions = {
                    enabled = false,
                    edits = {
                        enabled = false,
                    },
                },
            },
        }

        vim.o.autoread = true

        local opencode = require("opencode")

        vim.keymap.set({ "n", "x" }, "<leader>oa", function()
            opencode.ask("@this: ", { submit = true })
        end, { desc = "Ask opencode" })

        vim.keymap.set({ "n", "x" }, "<leader>op", function()
            opencode.prompt(" @this ")
        end, { desc = "Prompt opencode with context" })

        vim.keymap.set({ "n", "t" }, "<leader>ai", function()
            toggle_opencode()
        end, { desc = "Toggle opencode" })
    end,
}
