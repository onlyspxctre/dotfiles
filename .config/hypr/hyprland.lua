----------------
--- MONITORS ---
----------------

hl.monitor({
    output = "",
    mode   = "preferred",
    position = "auto",
    scale = "auto",
    supports_wide_color = -1,
})

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("HYPRCURSOR_THEME", "Adwaita-Hyprcursor")
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
    -- hl.exec_cmd(terminal_daemon)
    hl.exec_cmd("waybar &")
    hl.exec_cmd("swaybg -i ~/Pictures/Backgrounds/monterey.jpg -m fill")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
end)

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,

        border_size = 2,

        col = {
            active_border = {
                colors = { "rgba(ebbcba88)", "rgba(ea9a9788)" },
                angle = 45,
            },
            inactive_border = {
                colors = { "rgba(1f1d2eAA)", "rgba(26233aAA)" },
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
        rounding = 0,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        render_unfocused_fps = 1,
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    render = {
        direct_scanout = 2,
        new_render_scheduling = true,
        send_content_type = false
    },

    -- debug = {
    --     overlay = true,
    --     vfr = false
    -- }
})

require('spxctre.anims')
require('spxctre.input')
require('spxctre.binds')
require('spxctre.windowrules')
