—— Eject iPhone / iPod / iPad

tell application "iTunes"
	tell application "System Events" to set iTunesIsRunning to (name of processes) contains "iTunes"
	
	if not iTunesIsRunning then
		run
		delay 10
	end if

	repeat with sourceItem in sources
		if kind of sourceItem is iPod
			eject sourceItem
		end if
	end repeat
end tell
