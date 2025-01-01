return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require("ibl").setup {
      indent = { highlight = highlight, char = "│" },
      scope = { enabled = false },
    }
  end
}
