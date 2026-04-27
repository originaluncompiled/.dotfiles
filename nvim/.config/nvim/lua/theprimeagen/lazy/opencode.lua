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
        local opencode_win_opts = {
            split = "left",
            width = 69,
        }

        local function opencode_win()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_name(buf):match("opencode") then
                    return win
                end
            end
        end

        local function fix_opencode_width(win)
            if win and vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_set_width(win, opencode_win_opts.width)
                vim.wo[win].winfixwidth = true
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {
                    buffer = vim.api.nvim_win_get_buf(win),
                    desc = "Window command from opencode",
                })
            end
        end

        local function refresh_opencode()
            local function refresh()
                local win = opencode_win()
                if not win then
                    return
                end

                fix_opencode_width(win)
                vim.cmd("redraw!")

                local buf = vim.api.nvim_win_get_buf(win)
                local job = vim.b[buf].terminal_job_id
                if job then
                    vim.api.nvim_chan_send(job, "\12")
                end
            end

            vim.schedule(refresh)
            vim.defer_fn(refresh, 100)
        end

        local function focus_opencode()
            local win = opencode_win()
            if not win then
                return
            end

            fix_opencode_width(win)
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
        end

        vim.g.opencode_opts = {
            server = {
                start = function()
                    require("opencode.terminal").open(opencode_cmd, opencode_win_opts)
                    refresh_opencode()
                end,
                stop = function()
                    require("opencode.terminal").close()
                end,
                toggle = function()
                    require("opencode.terminal").toggle(opencode_cmd, opencode_win_opts)
                    refresh_opencode()
                end,
            },
        }

        vim.o.autoread = true

        local opencode = require("opencode")

        vim.keymap.set({ "n", "x" }, "<leader>oa", function()
            opencode.ask("@this: ", { submit = true })
        end, { desc = "Ask opencode" })

        vim.keymap.set({ "n", "x" }, "<leader>op", function()
            opencode.prompt("@this")
        end, { desc = "Prompt opencode with context" })

        vim.keymap.set({ "n", "t" }, "<leader>ai", function()
            local was_open = opencode_win() ~= nil
            opencode.toggle()
            if not was_open then
                vim.schedule(focus_opencode)
            end
        end, { desc = "Toggle opencode" })
    end,
}
