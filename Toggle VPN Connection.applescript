-- Toggles connection to VPN

-- A name of a VPN connection (see its value in System Preferences → Network)
set VPNName to "Some VPN"

tell application "System Events"
	tell current location of network preferences
		set VPNService to service VPNName
		set isVPNConnected to connected of current configuration of VPNService

		if isVPNConnected then
			disconnect VPNService
		else
			connect VPNService
		end if
	end tell
end tell
