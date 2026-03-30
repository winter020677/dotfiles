local wezterm = require("wezterm")
local keybinds = require("keybinds") -- 先ほどの keybinds.lua を使用

local config = wezterm.config_builder()

-- 基本設定
config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.90

-- ピンク系カラーテーマ
config.colors = {
  foreground = "#f5d0f0",
  background = "#0a080c",
  cursor_bg = "#ff79c6",
  cursor_border = "#ff79c6",
  cursor_fg = "#0a080c",
  selection_bg = "#3d1a4a",
  selection_fg = "#f5d0f0",
  ansi = {
    "#0a080c", -- black
    "#ff5c8a", -- red
    "#c0e86a", -- green
    "#ffb86c", -- yellow
    "#c792ea", -- blue
    "#ff79c6", -- magenta (pink!)
    "#80d9f5", -- cyan
    "#f5d0f0", -- white
  },
  brights = {
    "#5a3a5e", -- bright black
    "#ff85a0", -- bright red
    "#d4f57a", -- bright green
    "#ffd580", -- bright yellow
    "#d5a0ff", -- bright blue
    "#ffaadd", -- bright magenta
    "#a8eeff", -- bright cyan
    "#ffffff", -- bright white
  },
  tab_bar = {
    background = "#080608",
    active_tab = {
      bg_color = "#ff79c6",
      fg_color = "#0a080c",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#2d1a35",
      fg_color = "#c090b0",
    },
    inactive_tab_hover = {
      bg_color = "#4a2060",
      fg_color = "#f5d0f0",
    },
    new_tab = {
      bg_color = "#080608",
      fg_color = "#c090b0",
    },
  },
}

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

-- Wayland対応フルスクリーン切替 (Alt+Enter)
wezterm.on("toggle-fullscreen-opacity", function(window, pane)
  local is_full = window:is_full_screen()
  window:set_fullscreen(not is_full)
  window:set_config_overrides({ window_background_opacity = 0.85 })
end)

table.insert(config.keys, {
  key = "Enter",
  mods = "ALT",
  action = wezterm.action_callback(function(win, pane)
    wezterm.emit("toggle-fullscreen-opacity", win, pane)
  end),
})

return config
