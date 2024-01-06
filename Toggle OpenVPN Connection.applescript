-- Toggles OpenVPN Connect connection

if application "OpenVPN Connect" is not running then
	run application "OpenVPN Connect"
end if

tell application "System Events"
	tell menu 1 of menu bar item 1 of menu bar 2 of process "OpenVPN Connect"
		if menu item "Disconnect" exists then
			click menu item "Disconnect"
		else
			click menu item "Connect"
		end if
	end tell
end tell

