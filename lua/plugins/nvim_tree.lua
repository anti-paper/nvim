require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    git_ignored = false,
  },
})

-- start neovim with open nvim-tree
require("nvim-tree.api").tree.toggle(false, true)

