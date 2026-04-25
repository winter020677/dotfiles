local wezterm = require("wezterm")
local keybinds = require("keybinds")

local config = wezterm.config_builder()
local is_windows = wezterm.target_triple:find("windows") ~= nil

-- 基本設定
config.automatically_reload_config = true
config.font_size = 13.0
config.use_ime = false
config.window_background_opacity = 0.9
config.max_fps = 60
config.animation_fps = 1

-- OS 別設定
if is_windows then
  config.default_prog = { "wsl.exe" }
  config.default_cwd = "//wsl$/Ubuntu/home/winter/Desktop"
  config.font = wezterm.font({ family = "HackGen Console NF", weight = "Bold" })
else
  config.default_cwd = "/home/winter/Desktop"
  config.font = wezterm.font_with_fallback({
    { family = "HackGen Console NF", weight = "Bold" },
    { family = "Symbols Nerd Font Mono" },
  })
end

-- タイトルバー非表示
config.window_decorations = "RESIZE"

-- kawaii pink
config.colors = {
  foreground = "#ffc8e8",
  background = "#160a14",
  cursor_bg = "#ffb3e0",
  cursor_border = "#ffb3e0",
  cursor_fg = "#160a14",
  selection_bg = "#4a2a48",
  selection_fg = "#ffc8e8",
  ansi = {
    "#160a14", -- black
    "#ff5c8a", -- red
    "#c0e86a", -- green
    "#ffb86c", -- yellow
    "#d8b4f0", -- blue
    "#ffb3e0", -- magenta
    "#e0a0d8", -- cyan
    "#d4a8c8", -- white
  },
  brights = {
    "#2d1a35",
    "#ff5c8a",
    "#c0e86a",
    "#ffb86c",
    "#e8c8ff",
    "#ffd6ee",
    "#e8b8e8",
    "#ffc8e8",
  },
  tab_bar = {
    background = "#1f0f1c",
    active_tab = {
      bg_color = "#ffb3e0",
      fg_color = "#160a14",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1f0f1c",
      fg_color = "#8a6080",
    },
    inactive_tab_hover = {
      bg_color = "#2a1528",
      fg_color = "#ffc8e8",
    },
    new_tab = {
      bg_color = "#1f0f1c",
      fg_color = "#8a6080",
    },
  },
}

-- ウィンドウフレーム
config.window_frame = {
  font = wezterm.font({ family = "Hack Nerd Font", weight = "Regular" }),
  font_size = 13.0,
  active_titlebar_bg = "#1f0f1c",
  inactive_titlebar_bg = "#160a14",
}

-- ウィンドウ余白
config.window_padding = {
  left = 8, right = 8, top = 6, bottom = 6,
}

config.window_close_confirmation = "NeverPrompt"

-- タブバー
config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

-- キーバインド
config.disable_default_key_bindings = true
config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  window:set_right_status(name and ("TABLE: " .. name) or "")
end)

return config
