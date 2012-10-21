-- Script toggles connection to VPN.
-- The name of VPN sets in this variable ↓

set VPNServiceName to "NGS" -- ← Here it is.

-- I use the only one VPN, so, there is no Alfred’s query

tell application "System Events"
	tell current location of network preferences
		set VPNservice to service VPNServiceName
		set isConnected to connected of current configuration of VPNservice
		
		if isConnected then
			disconnect VPNservice
		else
			connect VPNservice
		end if
	end tell
end tell
