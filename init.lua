-- Options first (leader must be set before lazy loads any plugin),
-- then plugins, then everything that builds on top of them.
require("settings")
require("plugin_init")
require("keymaps")
require("autocmds")
