local wezterm = require("wezterm")
local lib = require("lib")
local windowConfig = require("window")
local fontConfig = require("font")
local formatTitle = require("format-title")
local keysConfig = require("keys")
local keyTables = require("key-tables")

local config = lib.mergeTables(windowConfig, fontConfig, formatTitle, keysConfig, keyTables)

return config
