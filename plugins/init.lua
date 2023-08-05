local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local registries = {}
table.insert(registries, "plugins/core")
table.insert(registries, "plugins/themes")

local pluginList = {}

for _, fileName in ipairs(registries) do
  local plugins = require(fileName)
  for _, pluginData in ipairs(plugins) do
    table.insert(pluginList, pluginData)
  end
end

require("lazy")
  .setup(pluginList)