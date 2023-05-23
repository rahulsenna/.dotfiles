-----------------------------------------------------

function smart_tab()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end

vim.keymap.set('n', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})


function AddSemicolon()
    -- Get the current line
    local current_line = vim.fn.getline('.')

    -- Check if the current line is empty or consists only of whitespace characters
    if current_line:match('^%s*$') then
        print("Current line is empty, semicolon not added")
        return
    end

    -- Check if the current line already ends with a semicolon
    if current_line:find(';%s*$') then
        print("Semicolon already exists")
        return
    elseif current_line:find('[\\(\\[{]$') then
        print("Line ends with an opening bracket, semicolon not added")
        return
    end

    -- Get the next line
    local next_line = vim.fn.getline(vim.fn.line('.') + 1)

    -- Check if the next line starts with an opening bracket
    if next_line:find('^%s*[\\[{(]') then
        print("Next line starts with an opening bracket, semicolon not added")
        return
    end

    -- Append a semicolon to the end of the current line
    vim.fn.setline('.', current_line .. ';')
    print("Semicolon added")
end

vim.cmd("command! AddSemicolon lua AddSemicolon()")
vim.keymap.set('n', ';', ':AddSemicolon<CR>', { silent=true, noremap = true })
vim.keymap.set('i', 'ý', ';', { silent=true, noremap = true })
vim.keymap.set('i', ';', '<Esc>', { silent=true, noremap = true })










