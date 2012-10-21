—— Eject iPhone / iPod / iPad

tell application "iTunes"
	run
	delay 10
	repeat with sourceItem in sources
		if kind of sourceItem is iPod
			eject source
		end if
	end repeat
end tell
