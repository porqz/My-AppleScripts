on alfred_script(q)
	set query to (q as text)
	
	tell application "iTunes"
		activate
		reveal playlist "Music"
	end tell

	tell application "System Events"
		 tell process "iTunes"
			set value of text field 1 of window "iTunes"  to query
			keystroke "f" using { command down, option down }
		 end tell
	end tell

end alfred_script
