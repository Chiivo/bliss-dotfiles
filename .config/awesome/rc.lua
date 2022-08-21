pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")
require("rules")
require("layouts")
require("keybinds")
require("mouse")
require("tags")
require("bar")
require("errors")
require("volume")
require("wallpaper")

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Collect Garbage
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
	timeout = 5,
	autostart = true,
	call_now = true,
	callback = function()
		collectgarbage("collect")
	end,
})

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autostart")
