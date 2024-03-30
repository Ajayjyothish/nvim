require("lint").linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
