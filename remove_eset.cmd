@Echo Off
@Cls
::Source https://community.spiceworks.com/topic/396652-uninstall-eset-smart-security-via-command-line
::Thanks to blapajk for it's command line
:: It parses the registry key "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info"
:: Looking For the "ProductCode" REG_SZ Value 
:: And launch the msiexec uninstall command for this ProductId
for /F "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /V ProductCode^| findstr /ri "REG_SZ"') do msiexec /x %%a /qn REBOOT="ReallySuppress" PASSWORD=""
