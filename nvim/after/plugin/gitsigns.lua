require('gitsigns').setup{
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '-' },
        topdelete    = { text = '^' },
        changedelete = { text = '~' },
        untracked    = { text = '?' },
    },

    current_line_blame = false,

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            require('keytex.keybindings').create_keybinding(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>rs', gs.stage_hunk, {desc = "Git stage hunk"})
        map('n', '<leader>rt', gs.reset_hunk, {desc = "Git reset hunk"})
        map('v', '<leader>rs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Git stage selected hunk"})
        map('v', '<leader>rt', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Git reset selected hunk"})

        map('n', '<leader>rn', gs.stage_buffer,                         {desc = "Git stage buffer"})
        map('n', '<leader>rb', gs.reset_buffer,                         {desc = "Git reset buffer"})
        map('n', '<leader>ru', gs.undo_stage_hunk,                      {desc = "Git undo stage hunk"})
        map('n', '<leader>rp', gs.preview_hunk,                         {desc = "Git preview hunk"})
        map('n', '<leader>ro', function() gs.blame_line{full=true} end, {desc = "Git blame line"})
        map('n', '<leader>ri', gs.toggle_current_line_blame,            {desc = "Git toggle current line blame"})
        map('n', '<leader>rd', gs.diffthis,                             {desc = "Git diff this"})
        map('n', '<leader>rD', function() gs.diffthis('~') end,         {desc = "Git diff ~"})
        map('n', '<leader>re', gs.toggle_deleted,                       {desc = "Toggle Git deleted"})

        -- Text object
        map({'o', 'x'}, 'ro', ':<C-U>Gitsigns select_hunk<CR>',         {desc = "Select Git hunk object"})
    end
}
