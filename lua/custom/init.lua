-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- -- Conceal Settings
-- -- in json files, conceal the quotes
-- -- In org-mode conceal the links
-- -- Markdown links can get concealed with this also.
-- -- NOTE: Moved to org-mode config
-- vim.opt.conceallevel = 2
-- vim.opt.concealcursor = "nc"

-- Folding Settings
-- These are used for the ufo plugin
-- + org-mode
-- vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Set scrolloff
vim.o.scrolloff = 10

-- Snippet paths
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/json"
vim.g.lua_snippets_path = "~/.config/nvim/lua/custom/snippets/lua"
vim.g.snipmate_snippets_path = "~/.config/nvim/lua/custom/snippets/snipmate"


--greatest remap ever
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-i>", "{zz")
vim.keymap.set("n", "<C-o>", "}zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete into void register 
vim.keymap.set({"n", "v"}, "<leader>d", "dd")
vim.keymap.set({"n", "v"}, "d", "\"_d")
-- vim.keymap.set({"n", "v"}, "dd", "V\"_d")

-- Paste into new line
vim.keymap.set("n", "<leader>p", "o<Esc>p")

-- Python
vim.api.nvim_set_keymap('n', '<leader>rp', ':w<CR>:!python3 %<CR>', { noremap = true })

-- Codeium
vim.g.codeium_filetypes = {
  python = false,
}
vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<c-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<c-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

-- -- Remove terminal padding when inside nvim:
---- For st:
-- function Sed(from, to, fname)
--   vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
-- end
--
-- function Reload()
--   vim.cmd(
--     string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
--   )
-- end
--
-- function DecreasePadding()
--   Sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
--   Reload()
--   Sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
-- end
--
-- function IncreasePadding()
--   Reload()
-- end
--
-- vim.cmd [[
--   augroup ChangeStPadding
--    au!
--    au VimEnter * lua DecreasePadding()
--    au VimLeavePre * lua IncreasePadding()
--   augroup END
-- ]]
--
-- -- Change Cwd to current file (AWESOME)
-- vim.cmd [[
-- set autochdir
-- ]]

---- For alacritty:
-- local function sed(from, to)
--   vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, "~/.config/alacritty/alacritty.yml"))
-- end
--
-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd("VimEnter", {
--   callback = function()
--     sed("x: 25", "x: 0")
--     sed("y: 25", "y: 0")
--   end,
-- })
--
-- autocmd("VimLeavePre", {
--   callback = function()
--     sed("x: 0", "x: 25")
--     sed("y: 0", "y: 25")
--   end,
-- })

-- TODO: Check wheter this is needed
-- -- Improves startup time
-- vim.loader.enable()

-- Stack Overflow Wrapper:
-- Define the Lua function to execute the Soq command
function run_soq(query)
  local cmd = "so " .. query
  require("custom.utils").extern(cmd, "vertical")
end

-- Create the Soq command using nvim_create_user_command
vim.api.nvim_create_user_command("Soq", "lua run_soq(<q-args>)", {
  nargs = "*",
  -- complete = "shellcmd",
})
