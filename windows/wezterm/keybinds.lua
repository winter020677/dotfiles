local wezterm = require("wezterm")
local act = wezterm.action

-- Show active key table in the right status
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  window:set_right_status(name and ("TABLE: " .. name) or "")
end)

return {
  keys = {
    -- Workspace
    { key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }) },
    { key = "$", mods = "LEADER", action = act.PromptInputLine({
        description = "(wezterm) Set workspace title:",
        action = wezterm.action_callback(function(win, pane, line)
          if line then
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
          end
        end),
      }),
    },
    { key = "w", mods = "LEADER|SHIFT", action = act.PromptInputLine({
        description = "(wezterm) Create new workspace:",
        action = wezterm.action_callback(function(win, pane, line)
          if line then
            win:perform_action(act.SwitchToWorkspace({ name = line }), pane)
          end
        end),
      }),
    },

    -- Tabs
    { key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
    { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
    { key = "{", mods = "LEADER", action = act.MoveTabRelative(-1) },
    { key = "}", mods = "LEADER", action = act.MoveTabRelative(1) },
    { key = "1", mods = "SUPER", action = act.ActivateTab(0) },
    { key = "2", mods = "SUPER", action = act.ActivateTab(1) },
    { key = "3", mods = "SUPER", action = act.ActivateTab(2) },
    { key = "4", mods = "SUPER", action = act.ActivateTab(3) },
    { key = "5", mods = "SUPER", action = act.ActivateTab(4) },
    { key = "6", mods = "SUPER", action = act.ActivateTab(5) },
    { key = "7", mods = "SUPER", action = act.ActivateTab(6) },
    { key = "8", mods = "SUPER", action = act.ActivateTab(7) },
    { key = "9", mods = "SUPER", action = act.ActivateTab(-1) },

    -- Panes
    { key = "d", mods = "LEADER", action = wezterm.action_callback(function(window, pane)
        local cwd = pane:get_current_working_dir()
        local path = cwd and cwd.file_path or nil
        local new_pane = pane:split({ direction = "Bottom" })
        if path then new_pane:send_text("cd " .. path .. "\n") end
      end)
    },
    { key = "r", mods = "LEADER", action = wezterm.action_callback(function(window, pane)
        local cwd = pane:get_current_working_dir()
        local path = cwd and cwd.file_path or nil
        local new_pane = pane:split({ direction = "Right" })
        if path then new_pane:send_text("cd " .. path .. "\n") end
      end)
    },
    { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "[", mods = "CTRL|SHIFT", action = act.PaneSelect },

    -- Font
    { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },

    -- Fullscreen
    { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

    -- Clipboard
    { key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },

    -- Command Palette & Reload
    { key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
    { key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },

    -- Key Tables
    { key = "s", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
    { key = "a", mods = "LEADER", action = act.ActivateKeyTable({ name = "activate_pane", timeout_milliseconds = 1000 }) },
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  },

  key_tables = {
    resize_pane = {
      { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
      { key = "Enter", action = "PopKeyTable" },
    },
    activate_pane = {
      { key = "h", action = act.ActivatePaneDirection("Left") },
      { key = "l", action = act.ActivatePaneDirection("Right") },
      { key = "k", action = act.ActivatePaneDirection("Up") },
      { key = "j", action = act.ActivatePaneDirection("Down") },
    },
    copy_mode = {
      { key = "h", action = act.CopyMode("MoveLeft") },
      { key = "j", action = act.CopyMode("MoveDown") },
      { key = "k", action = act.CopyMode("MoveUp") },
      { key = "l", action = act.CopyMode("MoveRight") },
      { key = "^", action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "$", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "0", action = act.CopyMode("MoveToStartOfLine") },
      { key = "o", action = act.CopyMode("MoveToSelectionOtherEnd") },
      { key = "O", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
      { key = ";", action = act.CopyMode("JumpAgain") },
      { key = "w", action = act.CopyMode("MoveForwardWord") },
      { key = "b", action = act.CopyMode("MoveBackwardWord") },
      { key = "e", action = act.CopyMode("MoveForwardWordEnd") },
      { key = "t", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
      { key = "f", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
      { key = "T", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
      { key = "F", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
      { key = "G", action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "g", action = act.CopyMode("MoveToScrollbackTop") },
      { key = "v", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
      { key = "V", action = act.CopyMode({ SetSelectionMode = "Line" }) },
      { key = "y", action = act.CopyTo("Clipboard") },
      { key = "Enter", action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }) },
      { key = "Escape", action = act.CopyMode("Close") },
    },
  },
}
