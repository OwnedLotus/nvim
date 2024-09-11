return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { 'nvim-lua/plenary.nvim'},
    event = "BufRead",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "c_sharp" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}

