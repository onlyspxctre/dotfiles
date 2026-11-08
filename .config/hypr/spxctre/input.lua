hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "ctrl:nocaps",
        kb_rules = "",

        repeat_delay = 250,
        repeat_rate = 60,

        follow_mouse = 1,
        sensitivity = -0.5,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.5,
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
	name = "pixa3838:00-093a:3838-touchpad",
	sensitivity = 0,
	accel_profile = "adaptive"
})

hl.device({
    name = "apple-spi-trackpad",
    sensitivity = 0,
    scroll_factor = 0.5,
    accel_profile = "adaptive",
})
