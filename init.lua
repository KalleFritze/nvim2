require("neotex.core")
require("neotex.bootstrap")
vim.keymap.set("n", "<leader>p", ":w! | sp | term python3 %<CR>", { noremap = true, silent = true })
vim.diagnostic.config({virtual_text = false})

