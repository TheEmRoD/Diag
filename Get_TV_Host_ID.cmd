for /f "tokens=2*" %a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer" /v ClientID') do set /a "ID=%b"
