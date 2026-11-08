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

-- hl.window_rule({
--     match = {
--         initial_title = "_crx_.*"
--     },
--     float = true,
--     max_size = { 600, 1000 },
--     center = true
-- })
hl.on("window.open", function(w)
    if not w.initial_title:match("_crx_.*") then return end
    hl.notification.create({ text = "Toggled extension", duration = 2000 })

    hl.dispatch(hl.dsp.window.float({ window = w}))
    hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, window = w}))
    hl.dispatch(hl.dsp.window.center({ window = w }))
    hl.dispatch(hl.dsp.focus({ window = w }))
end)
