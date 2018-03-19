-----------------------------------------
--widget for run filemanager
----------------------------------------
local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local naughty = require('naughty')

local icon = '/usr/share/icons/Arc/places/16/folder.png'

local FmWidget = wibox.widget {
    {
        image = icon,
        resize = false,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.container.margin(_, 3, 3, 3, _),
    set_image = function(self, path)
        self.icon.image = path
    end
}

FmWidget:connect_signal('button::press', function (_, _, _, btn)
    if (btn == 1) then
        spawn('thunar')
    end
end)

local tooltip = awful.tooltip({
    objects = {FmWidget},
    timer_function = function ()
        return 'Open file manager'
    end,
})

return FmWidget
