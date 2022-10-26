local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then return
end

return packer.startup(function(use)
    
    use('wbthomason/packer.nvim')

    -- implements lua functions that many plugins use
    use('nvim-lua/plenary.nvim')

    -- preferred colorschemes
    use('folke/tokyonight.nvim')

    -- tmux & split window navigation
    use('christoomey/vim-tmux-navigator')
    use('szw/vim-maximizer')

    -- essential plugins
    use('tpope/vim-surround')
    use('vim-scripts/ReplaceWithRegister')

    -- better comment
    use("numToStr/Comment.nvim")
    
    -- file explorer
	use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")

    if packer_bootstrap then
        require("packer").sync()
    end
end)