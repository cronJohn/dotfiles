local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
    front_end = 'WebGpu',
    color_scheme = 'Cai (Gogh)',
    font = wezterm.font 'JetBrains Mono',
    font_size = 15,

    window_background_opacity = 0.8,
    macos_window_background_blur = 30,
}

config.leader = { key = 'm', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    {
        key = 't',
        mods = 'LEADER|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 's',
        mods = 'LEADER|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'r',
        mods = 'LEADER|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'f',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'p',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'c',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize { 'Down', 5 },
    },
    {
        key = 'd',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize { 'Up', 5 },
    },
    {
        key = 'z',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'x',
        mods = 'LEADER|CTRL',
        action = wezterm.action.AdjustPaneSize { 'Right', 5 },
    },

}

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(
  config,
  {
    enabled_modules = {
      username = false,
      hostname = false,
      clock = false
    }
  }
)

return config
