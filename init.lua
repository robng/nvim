-- Set leader before loading plugins (lazy recommends this)
vim.g.mapleader = " "

require("lazy.bootstrap")
require("lazy.config")

require("custom.colors")
require("custom.opts")
require("custom.keys")

