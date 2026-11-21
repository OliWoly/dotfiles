-- Oliwier Kulczycki
-- Neovim config. Lives in ~/dotfiles/nvim, symlinked to ~/.config/nvim by install.sh.

-- ----- OPTIONS ----- --
-- (same as the old init.vim, just written in Lua: `set x` -> `vim.opt.x = true`)
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.termguicolors = true -- full 24-bit colours (kitty supports this)


-- ----- PLUGINS ----- --
-- Uses vim.pack, the plugin manager built into Neovim 0.12+.
-- Plugins are git-cloned to ~/.local/share/nvim/site/pack/core/opt/ on first launch.
-- Exact versions are recorded in nvim-pack-lock.json (next to this file, commit it!).
--   Update plugins:  :lua vim.pack.update()   (review, then :w to apply)
--   Remove a plugin: delete it from the list below, then :lua vim.pack.del({ 'name' })
if vim.pack == nil then
	vim.notify('Neovim 0.12+ is needed for plugins, skipping them', vim.log.levels.WARN)
	return
end

-- Rebuild treesitter parsers whenever the plugin itself gets updated.
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
			if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
			vim.cmd('TSUpdate')
		end
	end,
})

vim.pack.add({
	'https://github.com/folke/tokyonight.nvim',
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}, { confirm = false })


-- ----- COLOURSCHEME ----- --
-- transparent = true replaces the old `hi Normal guibg=none ...` lines,
-- so the kitty background shows through.
require('tokyonight').setup({ transparent = true })
vim.cmd.colorscheme('tokyonight-night')


-- ----- SYNTAX HIGHLIGHTING (treesitter) ----- --
-- Languages to download parsers for. Add any from
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
local languages = {
	'bash', 'c', 'cpp', 'css', 'html', 'java', 'javascript', 'json', 'lua',
	'markdown', 'markdown_inline', 'python', 'rust', 'toml', 'typescript',
	'vim', 'vimdoc', 'yaml',
}

-- Parsers get compiled locally, which needs the `tree-sitter` CLI.
-- Without it, Neovim's older built-in (regex) highlighting is used instead.
if vim.fn.executable('tree-sitter') == 1 then
	require('nvim-treesitter').install(languages) -- no-op if already installed
else
	vim.notify('tree-sitter CLI not found, using basic syntax highlighting', vim.log.levels.WARN)
end

-- Turn on treesitter highlighting for any file that has a parser installed.
vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		pcall(vim.treesitter.start) -- silently falls back to regex highlighting if no parser
	end,
})
