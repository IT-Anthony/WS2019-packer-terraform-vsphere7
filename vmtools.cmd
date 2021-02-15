@rem Installation silencieuse, sans redémarrage avec exec du WinRM
e:\setup64 /s /v "/qb REBOOT=R" & powershell a:\WINRM.ps1 & timeout /T 120 & shutdown /r
