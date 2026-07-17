
----------------
--- MONITORS ---
----------------

hl.monitor({
    output = "",
    mode   = "preferred",
    position = "auto",
    scale = "auto",
})

-----------------
--- VARIABLES ---
-----------------

local terminal = "footclient"
-- local terminal = "alacritty msg create-window"
local menu = "rofi -show run"
local drun = "rofi -show drun"
local grim = "grim -g \"$(slurp)\" - | swappy -f -"

local battery_saver = false

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("ANV_DEBUG", "video-decode,video-encode")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP")
    hl.exec_cmd("foot -s")
    hl.exec_cmd("waybar &")
    -- hl.exec_cmd("wlsunset -l 29.6 -L -82.3")
end)

-------------------
--- PERMISSIONS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 1,

        border_size = 1,

        col = {
            active_border = {
                colors = { "rgba(ebbcba88)", "rgba(ea9a9788)" },
                angle = 45,
            },
            inactive_border = {
                colors = { "rgba(00000000)", "rgba(00000000)" },
            }
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "master",
    },

    master = {
        new_status = "master",
        new_on_top = true,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 1,
            vibrancy = 0.1696,
            popups = true,
            xray = true,
        }
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },

    xwayland = {
        force_zero_scaling = true,
    }
})

hl.curve("specialWorkSwitch", {
    type = "bezier",
    points = {
        {0.05, 0.7},
        {0.1, 1},
    },
})

hl.curve("emphasizedAccel", {
    type = "bezier",
    points = {
        {0.3, 0},
        {0.8, 0.15},
    },
})

hl.curve("emphasizedDecel", {
    type = "bezier",
    points = {
        {0.05, 0.7},
        {0.1, 1},
    },
})

hl.curve("standard", {
    type = "bezier",
    points = {
        {0.2, 0},
        {0, 1},
    },
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 2.5,
    bezier = "emphasizedDecel",
    style = "popin 75%"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2.5,
    bezier = "emphasizedAccel",
    style = "popin 75%"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "emphasizedDecel",
})

hl.animation({
    leaf = "fadeLayers",
    enabled = true,
    speed = 2.5,
    bezier = "standard",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3.5,
    bezier = "emphasizedDecel",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3.5,
    bezier = "emphasizedAccel",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4.5,
    bezier = "standard",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4.5,
    bezier = "standard",
    style = "slidefade 85%",
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 4,
    bezier = "specialWorkSwitch",
    style = "slidefadevert 15%",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "emphasizedDecel",
})

hl.animation({
    leaf = "fadeDim",
    enabled = true,
    speed = 6,
    bezier = "standard",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 3,
    bezier = "standard",
})

-------------
--- INPUT ---
-------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "ctrl:nocaps",
        kb_rules = "",

        repeat_delay = 200,
        repeat_rate = 60,

        follow_mouse = 1,
        sensitivity = -0.5,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        }
    },
    cursor = {
        hide_on_touch = false,
        hide_on_tablet = false,
    },
    gestures = {
        workspace_swipe_distance = 1200,
        workspace_swipe_cancel_ratio = 0.3,
        workspace_swipe_min_speed_to_force = 10,
        workspace_swipe_direction_lock = false,
        workspace_swipe_forever = true,
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "ven_04f3:00-04f3:32ec-touchpad",
    sensitivity = 0,
    accel_profile = "adaptive",
})

hl.device({
    name = "elan-trackpoint",
    sensitivity = 0,
    accel_profile = "adaptive",
})

hl.device({
    name = "elan-touchpad",
    sensitivity = 0,
    accel_profile = "adaptive",
})

hl.device({
    name = "apple-spi-trackpad",
    sensitivity = 0,
    scroll_factor = 0.5,
    accel_profile = "adaptive",
})

-------------------
--- KEYBINDINGS ---
-------------------

local mod = "SUPER"

hl.bind(mod .. " + SHIFT_R", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(drun))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd(grim))
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

hl.bind(mod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mod .. " + K",    hl.dsp.focus({ direction = "up" }))
-- hl.bind(mod .. " + J",  hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mod .. " + K", hl.dsp.layout("cycleprev"))
hl.bind(mod .. " + RETURN", hl.dsp.layout("swapwithmaster"))

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

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

hl.bind(mod .. " + 0", hl.dsp.workspace.toggle_special("scratch"))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "special:scratch" } ))

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


------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

hl.window_rule({
    match = {
        class = "(helium|footclient)"
    },
    fullscreen_state = "0 1",
})

hl.layer_rule({
    match = {
        namespace = "(waybar|rofi)",
    },
    blur = true,
    ignore_alpha = 0,
})

hl.window_rule({
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
})
