return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local system_parser_rtp = "/usr/lib/x86_64-linux-gnu/nvim"
        if vim.uv.fs_stat(system_parser_rtp) then
            vim.opt.runtimepath:append(system_parser_rtp)
        end

        local languages = {
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash", "python"
        }

        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        if vim.fn.executable("tree-sitter") == 1 then
            treesitter.install(languages)
        end

        vim.treesitter.language.register('templ', 'templ')

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("ThePrimeagenTreesitter", { clear = true }),
            callback = function(args)
                if vim.bo[args.buf].filetype == "" then
                    return
                end

                local ok = pcall(vim.treesitter.start, args.buf)
                if ok then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}
