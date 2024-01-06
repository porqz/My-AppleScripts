-- Mounts a volume with SSHFS

on mountWithSSHFS(volumeName)
	set username to "username" -- Remote server user login
	set server to "server.domain.com" -- Remote server address

	set workingDirectoryPath to "/" -- Working directory on the remote server to be mounted
	set volumesDirectoryPath to "/Volumes"

	set SSHFSBinaryPath to "/usr/local/bin/sshfs" -- Simple "sshfs" does not work for me

	-- Options: caching, automatic reconnect, set volume name to volumeName variable value
	set options to "'auto_cache,reconnect,volname=" & volumeName & ",uid=501,gid=20'"

	if not isVolumeMounted(volumeName) then
		do shell script "mkdir " & volumesDirectoryPath & "/" & volumeName
		do shell script SSHFSBinaryPath & " " & username & "@" & server & ":" & workingDirectoryPath & " " & volumesDirectoryPath & "/" & volumeName & " -o " & options
	end if
end mountWithSSHFS

on isFileExist(fileName)
	tell application "Finder"
		return exists fileName as POSIX file
	end tell
end isFileExist

on isVolumeMounted(volumeName)
	return isFileExist("/Volumes/" & volumeName)
end isVolumeMounted


-- Alfred.app entry point
on alfred_script(q)
	set volumeName to (q as text)

	mountWithSSHFS(volumeName)
end alfred_script
