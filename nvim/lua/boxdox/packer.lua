vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme of choice
	use 'rebelot/kanagawa.nvim'

	-- necessary plugins
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
end)
