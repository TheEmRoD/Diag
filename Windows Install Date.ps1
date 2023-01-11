$test=(Get-ChildItem -Path HKLM:\System\Setup\Source* | ForEach-Object {Get-ItemProperty -Path Registry::$_} | Select-Object ProductName, ReleaseID, CurrentBuild, @{n="Install Date"; e={([DateTime]'1/1/1970').AddSeconds($_.InstallDate)}} | Sort-Object "Install Date" | Select-Object -First 1).'Install Date'
$test
#($test.Date.ToString("dd/MM/yyyy") | Out-String).Trim()
