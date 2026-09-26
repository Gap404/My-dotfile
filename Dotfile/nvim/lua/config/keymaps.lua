-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>")
-- 高亮搜索匹配结果 (原: set hlsearch)
vim.opt.hlsearch = true

-- 搜索时忽略大小写 (原: set ignorecase)
vim.opt.ignorecase = true

-- 当搜索包含大写字母时，自动启用大小写敏感 (原: set smartcase)
vim.opt.smartcase = true
-- 让你可以在 Neovim 和系统剪贴板之间复制粘贴
vim.opt.clipboard = "unnamedplus"
-- 快速退出 (原: map QQ :q!<CR>)
vim.keymap.set("n", "QQ", ":q!<CR>", { desc = "强制退出" })
-- 快速保存 (原: map WW :w<CR>)
vim.keymap.set("n", "WW", ":w<CR>", { desc = "保存文件" })
-- 取消搜索高亮 (原: map NHL :nohlsearch<CR>)
vim.keymap.set("n", "NHL", ":nohlsearch<CR>", { desc = "取消搜索高亮" })

-- 用 HJKL 快速移动光标（每次5行/列） (原: noremap H 5h 等)
vim.keymap.set("n", "H", "5h", { desc = "左移5列" })
vim.keymap.set("n", "L", "5l", { desc = "右移5列" })
vim.keymap.set("n", "J", "5j", { desc = "下移5行" })
vim.keymap.set("n", "K", "5k", { desc = "上移5行" })
-- dark
vim.opt.background = "dark"
