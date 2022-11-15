local opt = vim.opt

-- main
opt.spell = true                                -- When on spell checking will be done
opt.spelllang = 'en_us'                         -- US English words are recognized. Words that are not recognized are
                                                -- highlighted
opt.swapfile = false                            -- Don't write intermediate swap filess
opt.winblend = 0                                -- Add transparency to floating windows wheres 100 is fully transparent
opt.termguicolors = true                        -- Enables 24-bit RGB color
opt.splitbelow = true                           -- Splitting a window will put the new window below the current one
opt.splitright = true                           -- Splitting a window will put the new window right of the current one
opt.scrolloff = 25                              -- Minimal number of screen lines to keep above and below the cursor
opt.cmdheight = 1                               -- Number of screen lines to use for the command-line
opt.undofile = true                             -- Vim automatically saves undo history to an undo file
                                                -- (default "$XDG_DATA_HOME/nvim/undo//")
opt.encoding = 'utf-8'                          -- String-encoding used internally and for |RPC| communication
opt.fileencoding = 'utf-8'                      -- File-content encoding for the current buffer
opt.clipboard = 'unnamedplus'                   -- Nvim has no direct connection to the system clipboard. Instead it
                                                -- depends on a provider which transparently uses shell commands to
                                                -- communicate with the system clipboard or any other
                                                -- clipboard "backend"
opt.background = "dark"                         -- Or "light" for light mode
opt.showmode = false                            -- Turn off showing current mode since lualine plugin already shows it

-- user interface
opt.title = true                                -- Set the window's title, reflecting the file currently being edited
opt.number = true                               -- Add numbers to each line on the left-hand side
opt.relativenumber = true                       -- Show the line number relative to the line with the cursor
opt.wildoptions = 'pum'                         -- Gives scroll sign on the right side of the wildmenu
opt.pumblend = 5                                -- Display the completion matches using the popupmenu in the same style
                                                -- as the |ins-completion-menu

-- search options
opt.ignorecase = true                           -- Searches will become case insensitive, so if I search for apple I
                                                -- will get Apple, APPLE as well as apple
opt.smartcase = true                            -- With both ignorecase and smartcase turned on, a search is
                                                  -- case-insensitive if you enter the search string in ALL lower case.
                                                  -- For example, searching for apple will find Apple and APPLE.
                                                  -- However, if your search string has one or more characters in upper
                                                  -- case, it will assume that you want a case-sensitive search. So,
                                                  -- searching for Apple will only give you Apple but not apple or APPLE
opt.incsearch = true                            -- While searching through a file incrementally highlight matching
                                                   -- characters as you type
opt.hlsearch = true                             -- Adds a colored background to all the search results
opt.showmatch = true                            -- When a brancket is inserted, briefly jump to the matching one

-- indention options
opt.autoindent = true                           -- Copy indent from current line when starting a new line
opt.smartindent = true                          -- Reacts to the syntax/style of the code you are editing (especially
                                                -- for C). When having it on you also should have autoindent on.
opt.expandtab = true                            -- Controls whether or not Neovim should transform a Tab character
                                                -- to spaces
opt.shiftround = true                           -- Move selected lines with V using < > by spaces set in shiftwidth
opt.shiftwidth = 2                              -- When indenting with '<<' and '>>', use 2 spaces width
opt.tabstop = 2                                 -- The amount of space on screen a Tab character can occupy

-- text options
opt.wrap = false                                -- When on, lines longer than the width of the window will wrap and
                                                -- displaying continues on the next line
opt.cursorline = true                           -- Highlight the text line
opt.cursorcolumn = true                         -- Highlight the screen column of the cursor
opt.signcolumn = 'yes'                          -- The sign features allow both placement of a sign, or icon, in the
                                                -- left-hand side of the window and definition of a highlight which
                                                -- will be applied to that line.
opt.inccommand = 'split'                        -- During vim substitution :%s/ open the split in the bottom
opt.list = true                                 -- By default, show tabs as ">", trailing spaces as "-", and
                                                -- non-breakable space characters as "+". Useful to see the difference
                                                -- between tabs and spaces and for trailing blanks.
