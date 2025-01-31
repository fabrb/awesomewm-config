-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local naughty = require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify(
		{
			title = "Oops, there were errors during startup!",
            text = awesome.startup_errors,
			position = "bottom_right"
		}
	)
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal(
		"debug::error",
		function(err)
			-- Make sure we don't go into an endless error loop
			if in_error then
				return
			end
			in_error = true

			naughty.notify(
				{
					preset = naughty.config.presets.critical,
					title = "Oops, an error happened!",
                    text = tostring(err),
					position = "bottom_right"
				}
			)
			in_error = false
		end
	)
end
-- }}}
