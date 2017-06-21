@Echo Off
@Cls
for /F "tokens=3" %a in ('reg query "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /V ProductCode^| findstr /ri "REG_SZ"') do msiexec /x %a /qn REBOOT="ReallySuppress" PASSWORD=""
