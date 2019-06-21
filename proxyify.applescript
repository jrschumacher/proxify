set supportedApps to {"Visual Studio Code", "Slack"}
set proxy to "http://localhost:3128"

set apps to do shell script "ls /Applications | sed 's/.app$//'"
set appProxyList to paragraphs of apps

set appList to {}
repeat with appName in appProxyList
	if supportedApps contains appName then
		set end of appList to appName
	end if
end repeat

set appToProxify to choose from list appList with title "Title" with prompt "Which app do you want to open proxified?"

set formattedAppStr to do shell script "echo \"" & appToProxify & "\" | sed 's/ /\\\\ /g'"

do shell script "open -a " & formattedAppStr & " --args --proxy-server=" & proxy
