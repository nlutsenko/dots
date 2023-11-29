#!/usr/bin/osascript

tell application "System Settings"
	activate
	delay 1.0
	set current pane to pane id "com.apple.systempreferences.GeneralSettings"
	set current pane to pane id "com.apple.Accessibility-Settings.extension"
end tell

delay 0.5

tell application "System Events" to tell process "System Settings"
	# Navigate to Zoom settings
	set acs_window to splitter group 1 of group 1 of window "Accessibility"
	set zoom_button to button 2 of group 1 of scroll area 1 of group 1 of group 2 of acs_window
	click zoom_button
	# Turn on "Use scroll gesture with modifier keys to zoom"
	set zoom_window to splitter group 1 of group 1 of window "Zoom"
	set zoom_checkbox to checkbox "Use scroll gesture with modifier keys to zoom" of group 1 of scroll area 1 of group 1 of group 2 of zoom_window
	tell zoom_checkbox
		if not (its value as boolean) then click
	end tell
end tell