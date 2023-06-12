-- I think this highlights matching words of under the cursor

local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

vim.cmd [[  autocmd VimEnter * :hi def IlluminatedWordText guibg=#111111 ctermbg=DarkGrey ]]
vim.cmd [[  autocmd VimEnter * :hi def IlluminatedWordRead guibg=#111111 ctermbg=DarkGrey ]]
vim.cmd [[  autocmd VimEnter * :hi def IlluminatedWordWrite guibg=#111111 ctermbg=DarkGrey ]]

illuminate.configure({
  delay = 250, -- delay in ms
})
