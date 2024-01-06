-- Syncs an iPhone / iPod / iPad with iTunes

tell application "iTunes"
	tell application "System Events" to set isITunesRun to (name of processes) contains "iTunes"

	if not isITunesRun then
		run
		delay 10
	end if

	repeat with sourceItem in sources
		if kind of sourceItem is iPod
			update sourceItem
		end if
	end repeat
end tell
