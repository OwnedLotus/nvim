return {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
     config = function()
         require("tokyodark").setup({
             custom_highlights = function(colors, palette)
                 return {
                     -- Blink CMP menu highlights
                     BlinkCmpMenu = { bg = colors.bg_dark },
                     BlinkCmpMenuBorder = { fg = colors.blue },
                     BlinkCmpMenuSelection = { bg = colors.bg_highlight, fg = colors.fg },
                     BlinkCmpLabel = { fg = colors.fg },
                     BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
                     BlinkCmpKind = { fg = colors.purple },
                     BlinkCmpDoc = { bg = colors.bg_dark },
                     BlinkCmpDocBorder = { fg = colors.blue },
                     -- Hover/float popups
                     NormalFloat = { bg = colors.bg_dark },
                     FloatBorder = { fg = colors.blue },
                     FloatTitle = { fg = colors.fg, bold = true },
                 }
             end,
         })
         vim.cmd("colorscheme tokyodark")
     end,
}