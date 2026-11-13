-- TODO:
-- Source: ~/.config/hypr/colors.conf — convert this file to Lua and ensure it is on Lua's package.path.
-- require("colors")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

--###############
--## MONITORS ###
--###############

-- main setup
hl.monitor({
    output = "DP-1",
    mode = "highres@highrr",
    position = "2560x0",
    scale = "1",
})

hl.monitor({
    output = "DP-2",
    mode = "highres@highrr",
    position = "0x0",
    scale = "1",
})

-- laptop
hl.monitor({
    output = "HDMI-A-1",
    mode = "highres@highrr",
    position = "auto",
    scale = "1",
})

-- fernseher
-- monitor= HDMI-A-1,3840x2160@30,auto,2

--##################
--## MY PROGRAMS ###
--##################

local terminal = "kitty"
local fileManager = "thunar"
local menu =
"wofi --show drun --width 500 --normal-window --allow-images --hide-scroll --lines 4 --style ~/.config/hypr/wofi.css"
local browser = "firefox"
local lock = "hyprlock --grace 3"
local snap = "hyprshot -m region -o ~/screenshots/ -f screenshot_$(date +\"%Y_%m_%d_%H_%M_%S\").png -z"

--################
--## AUTOSTART ###
--################

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("xrandr --output HDMI-A-1 --primary")
end)

--############################
--## ENVIRONMENT VARIABLES ###
--############################

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--##################
--## PERMISSIONS ###
--##################

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(snap))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("/home/mlpx/.config/hypr/randwall.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("/home/mlpx/.config/hypr/setwall.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("killall waybar"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.config({
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    general = {
        gaps_in = 0,
        gaps_out = 0,
        float_gaps = 25,
        border_size = 0,
        col = {
            -- active_border = "0xFF" .. TXT_FG, --TODO: after fixing colors import
            -- inactive_border = "0xFF" .. TXT_BG,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        rounding_power = 1.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = 0,
            range = 16,
            render_power = 2,
            -- color = "0x55" .. BG, --TODO after fixing colors import
        },
        blur = {
            enabled = false,
            size = 3,
            passes = 3,
            xray = true,
            noise = 0.1,
            brightness = 0.2,
        },
    },
    animations = {
        enabled = false --"no, please :)",
    },
    dwindle = {
        -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },
    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,  -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
    --############
    --## INPUT ###
    --############
    -- https://wiki.hypr.land/Configuring/Variables/#input
    input = {
        repeat_delay = 250,
        repeat_rate = 50,
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        -- sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        sensitivity = 0.3,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = false,
        },
    }
})



hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    -- Ignore maximize requests from all apps. You'll probably like this.
    suppress_event = "maximize",
})

hl.window_rule({
    name = "floating border",
    match = {
        float = true,
    },
    border_size = 0,
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    -- Fix some dragging issues with XWayland
    no_focus = true,
})

hl.window_rule({
    name = "image viewer floating center",
    match = {
        class = "imv",
    },
    float = true,
    size = "1280 720",
    center = true,
})

hl.window_rule({
    name = "floating terminal",
    match = {
        class = "kitty",
    },
    -- match:float = true
    float = true,
    size = "1280 960",
    center = true,
})

hl.window_rule({
    name = "floating spotify",
    match = {
        class = "Spotify",
    },
    -- match:float = true
    float = true,
    size = "900 900",
    move = "0 0",
    workspace = "special:magic"
})

hl.window_rule({
    name = "steam friendslist",
    match = {
        title = "Friends List",
    },
    float = true,
    size = "350 800",
    center = true,
})

hl.window_rule({
    name = "steam settings",
    match = {
        title = "Steam Settings",
    },
    float = true,
    move = "1 1",
})

hl.layer_rule({
    name = "waybar layer blurr",
    match = {
        namespace = "waybar",
    },
    blur = true,
})
