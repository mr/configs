---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "cure 8"

theme.bg_normal     = "#1d1f21"
theme.bg_focus      = "#1d1f21"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#cedbe9"
theme.fg_focus      = "#6095c5"
theme.fg_urgent     = "#6095c5"
theme.fg_minimize   = "#6095c5"
theme.tasklist_fg_focus = "#6095c5"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#6095c5"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/matt/.config/awesome/themes/matt/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/matt/.config/awesome/themes/matt/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/matt/.config/awesome/themes/matt/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/matt/.config/awesome/themes/matt/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/matt/.config/awesome/themes/matt/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/matt/.config/awesome/themes/matt/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/matt/.config/awesome/themes/matt/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/matt/.config/awesome/themes/matt/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/matt/.config/awesome/themes/matt/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/matt/.config/awesome/themes/matt/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/matt/.config/awesome/themes/matt/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/matt/.config/awesome/themes/matt/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/matt/.config/awesome/themes/matt/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/matt/.config/awesome/themes/matt/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/matt/.config/awesome/themes/matt/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/matt/.config/awesome/themes/matt/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/matt/.config/awesome/themes/matt/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/matt/.config/awesome/themes/matt/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/matt/.config/awesome/themes/matt/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/matt/.config/awesome/themes/matt/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/matt/.config/awesome/themes/matt/titlebar/maximized_focus_active.png"

theme.wallpaper = "/usr/share/awesome/themes/default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/matt/.config/awesome/themes/matt/layouts/fairhw.png"
theme.layout_fairv = "/home/matt/.config/awesome/themes/matt/layouts/fairvw.png"
theme.layout_floating  = "/home/matt/.config/awesome/themes/matt/layouts/floatingw.png"
theme.layout_magnifier = "/home/matt/.config/awesome/themes/matt/layouts/magnifierw.png"
theme.layout_max = "/home/matt/.config/awesome/themes/matt/layouts/maxw.png"
theme.layout_fullscreen = "/home/matt/.config/awesome/themes/matt/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/matt/.config/awesome/themes/matt/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/matt/.config/awesome/themes/matt/layouts/tileleftw.png"
theme.layout_tile = "/home/matt/.config/awesome/themes/matt/layouts/tilew.png"
theme.layout_tiletop = "/home/matt/.config/awesome/themes/matt/layouts/tiletopw.png"
theme.layout_spiral  = "/home/matt/.config/awesome/themes/matt/layouts/spiralw.png"
theme.layout_dwindle = "/home/matt/.config/awesome/themes/matt/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

theme.widget_net = "/home/matt/.config/awesome/icons/sm4tik/net_down_03.png"
theme.widget_netup = "/home/matt/.config/awesome/icons/sm4tik/net_up_03.png"
theme.widget_music = "/home/matt/.config/awesome/icons/sm4tik/note.png"
theme.widget_highbat = "/home/matt/.config/awesome/icons/sm4tik/bat_full_01.png"
theme.widget_lowbat = "/home/matt/.config/awesome/icons/sm4tik/bat_low_01.png"
theme.widget_emptybat = "/home/matt/.config/awesome/icons/sm4tik/bat_empty_01.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
