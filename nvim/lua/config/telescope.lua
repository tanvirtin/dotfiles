local telescope = require('telescope')

telescope.setup({
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        file_ignore_patterns = { 'package.lock.json', 'yarn.lock', 'node_modules/*' },
    }
})

telescope.load_extension('fzf')
