return {
    {'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })
  end,
  }
}
