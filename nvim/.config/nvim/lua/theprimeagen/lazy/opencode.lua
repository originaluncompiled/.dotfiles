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
        local opencode_terminal_opts = {
            win = {
                position = "left",
                width = 69,
                on_win = function(win)
                    vim.wo[win.win].winfixwidth = true
                    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {
                        buffer = win.buf,
                        desc = "Window command from opencode",
                    })
                end,
            },
        }

        local function opencode_win()
            local terminal = require("snacks.terminal").get(opencode_cmd, { create = false })
            if terminal and terminal:win_valid() then
                return terminal.win
            end
        end

        local function fix_opencode_width(win)
            if win and vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_set_width(win, opencode_terminal_opts.win.width)
                vim.wo[win].winfixwidth = true
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

        local function open_opencode_if_needed()
            if opencode_win() then
                return
            end

            vim.g.opencode_opts.server.toggle()
            vim.schedule(focus_opencode)
        end

        vim.g.opencode_opts = {
            server = {
                start = function()
                    require("snacks.terminal").get(opencode_cmd, opencode_terminal_opts)
                    refresh_opencode()
                end,
                stop = function()
                    local terminal = require("snacks.terminal").get(opencode_cmd, { create = false })
                    if terminal then
                        terminal:close()
                    end
                end,
                toggle = function()
                    require("snacks.terminal").toggle(opencode_cmd, opencode_terminal_opts)
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
            open_opencode_if_needed()
            opencode.prompt("@this")
        end, { desc = "Prompt opencode with context" })

        vim.keymap.set({ "n", "t" }, "<leader>ai", function()
            local was_open = opencode_win() ~= nil
            vim.g.opencode_opts.server.toggle()
            if not was_open then
                vim.schedule(focus_opencode)
            end
        end, { desc = "Toggle opencode" })
    end,
}
