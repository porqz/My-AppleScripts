—— Sync iPhone / iPod / iPad

tell application "iTunes"
	repeat with sourceItem in sources
		if kind of sourceItem is iPod
			update source
		end if
	end repeat
end tell
