local terminal = "footclient"
-- local terminal = "ghostty +new-window"
local terminal_daemon = "foot -s"
local quickattach = "footclient -e tmux a -d || tmux new -d"
local menu = "rofi -show run"
local drun = "rofi -show drun"
local grim = "grim -g \"$(slurp)\" - | swappy -f -"

battery_saver = false
keyboard = true

local mod = "SUPER"

hl.bind(mod .. " + SHIFT_R", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + Space", hl.dsp.exec_cmd(drun))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd(grim))
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

hl.bind(mod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.layout("mfact +0.05"))
hl.bind(mod .. " + SHIFT + H", hl.dsp.layout("mfact -0.05"))
hl.bind(mod .. " + SHIFT + O", hl.dsp.layout("mfact exact 0.55"))
-- hl.bind(mod .. " + K",    hl.dsp.focus({ direction = "up" }))
-- hl.bind(mod .. " + J",  hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mod .. " + K", hl.dsp.layout("cycleprev"))
hl.bind(mod .. " + RETURN", hl.dsp.layout("swapwithmaster"))

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mod .. " + ALT + F9", function()
    keyboard = not keyboard
    hl.device({
        name = "at-translated-set-2-keyboard",
        enabled = keyboard
    })

    hl.notification.create({ text = "Toggled On-board Keyboard", duration = 2000 })
end, { locked = true })


hl.bind(mod .. " + SHIFT + F9", function()
    battery_saver = not battery_saver
    if battery_saver then
        hl.notification.create({ text = "Battery Saver: ON", duration = 2000 })
    else
        hl.notification.create({ text = "Battery Saver: OFF", duration = 2000 })
        hl.exec_cmd("hyprctl reload")
        return
    end

    hl.config({
        general = {
            gaps_in = 0,
            gaps_out = 0,
        },
        animations = {
            enabled = false,
        },
        decoration = {
            shadow = {
                enabled = false,
            },
            blur = {
                enabled = false,
            },
            rounding = 0,
        },
    })
end)

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 9 do
    hl.bind(mod .. " + " .. i,             hl.dsp.focus({ workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + 0", hl.dsp.workspace.toggle_special("s"))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "special:s" } ))

hl.bind(mod .. " + T", function()
    hl.config({
        general = {
            layout = "master"
        }
    })
end)
hl.bind(mod .. " + M", function()
    hl.config({
        general = {
            layout = "monocle"
        }
    })
end)

-- Scroll through existing workspaces with mod + scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
