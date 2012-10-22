-- The script mounts volumes with SSHFS

on toLowerCase(someText)
	return do shell script "echo '" & someText & "' | tr '[:upper:]' '[:lower:]'"
end toLowerCase

on capitalize(someText) -- to do
	return someText
end capitalize


on fileExists(fileName)
	tell application "Finder"
		return exists fileName as POSIX file
	end tell
end fileExists

on isMounted(volumeName)
	return fileExists("/Volumes/" & volumeName)
end isMounted

on mountWithSSHFS(volumeName)
	set username to "username" -- Remote system user login
	set server to "server.domain.com" -- Server address

	set workingDirectoryPath to "/" -- Working directory on the server, will mounted!
	set volumesDirectoryPath to "/Volumes" —— Can’t touch this

	set SSHFSApplicationPath to "/usr/local/bin/sshfs" -- Simple "sshfs" does not work for me
	set options to "'auto_cache,reconnect,volname=" & capitalize(volumeName) & ",uid=501,gid=20'" -- Options: caching, automatic reconnect, set volume name to volumeName variable value

	if not isMounted(volumeName) then
		do shell script "mkdir " & volumesDirectoryPath & "/" & volumeName
		do shell script SSHFSApplicationPath & " " & username & "@" & server & ":" & workingDirectoryPath & " " & volumesDirectoryPath & "/" & capitalize(volumeName) & " -o " & options
	end if
end mountWithSSHFS


-- int main(...)
on alfred_script(q)
	set volumeName to (q as text)
	
	mountWithSSHFS(volumeName)
end alfred_script
