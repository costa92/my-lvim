-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- keymap 
--


-- 修改主题
lvim.colorscheme = "tokyonight"
lvim.builtin.theme.name = "tokyonight"
lvim.builtin.theme.tokyonight.options.on_highlights = function(hl, c)
    hl.WinSeparator = {
        fg = c.orange,
        bold = true,
    }
end


-- user plugin --
require("user.plugin").config()
-- vimtex config --
require("user.vimtex").config()
-- key binding settings --
require("user.key_bindings").config()



