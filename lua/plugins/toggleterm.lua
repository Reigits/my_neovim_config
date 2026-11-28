return
{
  'akinsho/toggleterm.nvim',
  version = '*',
  opts =
  {
	  autochdir = true,
	  direction = 'float',
      float_opts =
      {
          border = 'curved',
      },
      start_in_insert = true, -- insert mode on every entrance of a terminal
      persist_mode = false, -- do not persist the previous mode
  }
}
