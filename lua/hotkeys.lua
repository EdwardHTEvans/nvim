local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
map('n', '<C-n>', ':vsp | terminal<CR>i', opts)

map('n', 'ff', ':Telescope find_files<CR>', opts)
map('n', 'qq', ':q<CR>', opts)
map('t', '<Esc>', [[<C-\><C-n>]], opts)

map('n', '<C-S-Up>', ':resize -1<CR>', opts)
map('n', '<C-S-Down>', ':resize +1<CR>', opts)
map('n', '<C-S-Left>', ':vertical resize -1<CR>', opts)
map('n', '<C-S-Right>', ':vertical resize +1<CR>', opts)

map('n', '<S-Left>', '<Esc>v<Left>', opts)
map('n', '<S-Right>', '<Esc>v<Right>', opts)
map('n', '<S-Up>', '<Esc>v<Up>', opts)
map('n', '<S-Down>', '<Esc>v<Down>', opts)
map('n', '<S-End>', '<Esc>v<End>', opts)

map('n', '<A-Up>', '<C-w>k', opts)
map('n', '<A-Down>', '<C-w>j', opts)
map('n', '<A-Left>', '<C-w>h', opts)
map('n', '<A-Right>', '<C-w>l', opts)

map('i', '<S-Left>', '<Esc>v<Left>', opts)
map('i', '<S-Right>', '<Esc>v<Right>', opts)
map('i', '<S-Up>', '<Esc>v<Up>', opts)
map('i', '<S-Down>', '<Esc>v<Down>', opts)
map('i', '<S-End>', '<Esc>v<End>', opts)

map('x', '<S-Left>', '<Left>', opts)
map('x', '<S-Right>', '<Right>', opts)
map('x', '<S-Up>', '<Up>', opts)
map('x', '<S-Down>', '<Down>', opts)

map('x', '<Left>', '<Esc><Left>', opts)
map('x', '<Right>', '<Esc><Right>', opts)
map('x', '<Up>', '<Esc><Up>', opts)
map('x', '<Down>', '<Esc><Down>', opts)

map('x', '<C-c>', 'y', opts)
map('x', '<C-x>', 'd', opts)
map('x', '<C-x>', 'd', opts)

map('n', '<C-c>', 'yy', opts)
map('n', '<C-v>', 'P', opts)
map('n', '<C-z>', 'u', opts)
map('i', '<C-v>', '<Esc>P', opts)
map('i', '<C-z>', '<Esc>u', opts)

vim.api.nvim_create_user_command(
    'Debug',
    function()
        require'dap'.continue()
    end,
    {}
)

map('n', '<C-A-b>', ':lua require(\'dap\').toggle_breakpoint()<CR>', opts)
map('n', '<C-A-n>', ':lua require(\'dap\').step_over()<CR>', opts)
map('n', '<C-A-m>', ':lua require(\'dap\').step_into()<CR>', opts)
map('n', '<C-A-j>', ':lua require(\'dap\').step_out()<CR>', opts)
map('n', '<C-A-k>', ':lua require(\'dap\').repl.open()<CR>', opts)
map('n', '<C-A-l>', ':lua require(\'dap\').repl.close()<CR>', opts)
map('n', '<C-A-c>', ':lua require(\'dap\').continue()<CR>', opts)
map('n', '<C-A-x>', ':lua require(\'dap\').close()<CR>', opts)
