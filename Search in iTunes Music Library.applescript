—— Insert in iTunes’s search field query and tries to search

on alfred_script(q)
	set query to (q as text)

	tell application "iTunes"
		activate
		reveal playlist "Music"
	end tell

	tell application "System Events"
		tell process "iTunes"
			tell window "iTunes"
				set focused of text field 1 to true
				set value of text field 1 to query
			end tell
		end tell
	end tell

end alfred_script
