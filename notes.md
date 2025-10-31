Primagens neovim setup
See https://github.com/ThePrimeagen/neovimrc/issues/5
1. If you haven't already, `git clone` this repo into `~/.config/nvim` by doing `git clone https://github.com/ThePrimeagen/neovimrc.git ~/.config/nvim`
2. Now that you have Prime's neovimrc in the right place, do `git clone https://github.com/ThePrimeagen/harpoon.git ~/personal/harpoon -b harpoon2`.
    - The `-b` flag denotes that we should be checking out the `harpoon2` branch directly instead of `master`

##### Nav
`%` new file
`d` make a directory
` pv` close the file and go to explorer. You have to press pv fast
` ps` grep
` pf` file search
`<leader>a` add file to harpoon
`ctrl e` edit harpoon files
 "<C-h>", function() harpoon:list():select(1) end)
 "<C-t>", function() harpoon:list():select(2) end)
 "<C-n>", function() harpoon:list():select(3) end)
 "<C-s>", function() harpoon:list():select(4) end)

 "<leader><C-h>", function() harpoon:list():replace_at(1) end)
 "<leader><C-t>", function() harpoon:list():replace_at(2) end)
 "<leader><C-n>", function() harpoon:list():replace_at(3) end)
 "<leader><C-s>", function() harpoon:list():replace_at(4) end)

"<C-w>w" change focus
"<C-w>c" close window
"<leader>vrr" find references (<C-j/k> to scroll)
"<leader>pl" git permalink
"<leader>pr" resume grep window

`<C-w>c` close window
`<C-w>w` swap window

##### Editing
`o` insert after line
`yy` copy line
`}` or `{` jump to code block up and down
`]}` or `[{` go to opening or closing curly brace
`<` and `>` indent selection
`ctrl r` redo
`%` go to matching bracket
`[{` go to first left curly brace
`V` select line

##### Searching
`/` seach mode
`ctrl g` next occurence
`ctrl t` prev occurence
`\c` case insensitive search
`*` highlight next occurrence of word under cursor
`#` highlight previous occurrence of word under cursor





