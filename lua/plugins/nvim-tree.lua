return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.api.nvim_set_keymap("n", "<Space>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
}
