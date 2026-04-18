local wezterm = require("wezterm")
local keybinds = require("keybinds") -- 先ほどの keybinds.lua を使用

local config = wezterm.config_builder()

-- 基本設定
config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = false
config.window_background_opacity = 0.9
config.max_fps = 60
config.animation_fps = 1

-- タイトルバー非表示
config.window_decorations = "RESIZE"

-- Kanagawa Wave
config.colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",
  cursor_bg = "#c8c093",
  cursor_border = "#c8c093",
  cursor_fg = "#1f1f28",
  selection_bg = "#2d4f67",
  selection_fg = "#dcd7ba",
  ansi = {
    "#090618", -- black
    "#c34043", -- red
    "#76946a", -- green
    "#c0a36e", -- yellow
    "#7e9cd8", -- blue
    "#957fb8", -- magenta
    "#6a9589", -- cyan
    "#c8c093", -- white
  },
  brights = {
    "#727169", -- bright black
    "#e82424", -- bright red
    "#98bb6c", -- bright green
    "#e6c384", -- bright yellow
    "#7fb4ca", -- bright blue
    "#938aa9", -- bright magenta
    "#7aa89f", -- bright cyan
    "#dcd7ba", -- bright white
  },
  tab_bar = {
    background = "#15161e",
    active_tab = {
      bg_color = "#7e9cd8",
      fg_color = "#15161e",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1f1f28",
      fg_color = "#727169",
    },
    inactive_tab_hover = {
      bg_color = "#2a2a37",
      fg_color = "#dcd7ba",
    },
    new_tab = {
      bg_color = "#15161e",
      fg_color = "#727169",
    },
  },
}

-- フォント
config.font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" })

-- 枠なし風フルスクリーン対応
config.window_frame = {
  font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" }),
  font_size = 12.0,
  active_titlebar_bg = "#080608",
  inactive_titlebar_bg = "#080608",
}

-- ウィンドウ余白
config.window_padding = {
  left = 8, right = 8, top = 6, bottom = 6,
}

-- ペイン/ウィンドウを閉じる際の確認ポップアップを無効化
config.window_close_confirmation = "NeverPrompt"

-- タブバー
config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- キーバインド
config.disable_default_key_bindings = true
config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

-- 右ステータスにキーテーブル名表示
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

return config
