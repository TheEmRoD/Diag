Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

    
function AssignTeamViewer {
# Assign TeamViewer
    if (Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
        Start-Process -FilePath "C:\Program Files\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY="
    }
    if (Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
        Start-Process -FilePath "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY="
    }
}

function Uninstall-TV {
    # Check if TeamViewer is running
    if (Get-Process TeamViewer -ErrorAction SilentlyContinue) {
        Stop-Process -Name TeamViewer -Force
        Start-Sleep -Seconds 2
    }

    # Uninstall TeamViewer
    $product = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE (Name LIKE 'TeamViewer%')"
    if ($product) {
        $product.Uninstall()
    }

    Install-TV
}

function Install-TV {
    # Deployment of TeamViewer 15
    Set-Location $PSScriptRoot
    Remove-Item -Path "$PSScriptRoot\TeamViewer_Host.zip" -ErrorAction SilentlyContinue
    Remove-Item -Path "$PSScriptRoot\Host" -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$PSScriptRoot\Full" -Recurse -ErrorAction SilentlyContinue

    # Force TLS1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    # Download TeamViewer
    # Check if curl is an alias or a standalone command
    $command = Get-Command "curl" -ErrorAction SilentlyContinue
    if ($command.CommandType -eq "Application") {
        # Use curl to download the file
        & curl.exe -o "$PSScriptRoot\TeamViewer_Host.zip" "https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI64.zip"
    } else {
        # Use Invoke-WebRequest to download the file
        Invoke-WebRequest -Uri "https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI64.zip" -OutFile "$PSScriptRoot\TeamViewer_Host.zip"
    }

    # Extract the downloaded file

    $PSVersion = $PSVersionTable.PSVersion.Major
    if ($PSVersion -lt 5) {
        Write-Host "La version de PowerShell est inférieure à 5.x"
        unzip "$PSScriptRoot\TeamViewer_Host.zip" "$PSScriptRoot"
    } else {
        Write-Host "La version de PowerShell est 5.x ou supérieure"
        Expand-Archive -Path "$PSScriptRoot\TeamViewer_Host.zip" -DestinationPath "$PSScriptRoot" -Force
    }

   # Install TeamViewer
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/passive /norestart /i `"$PSScriptRoot\Host\TeamViewer_Host.msi`" /qn DESKTOPSHORTCUTS=0 CUSTOMCONFIGID=6vqtzpn APITOKEN=22841762-iM9NxwMlx1b0IDp5fQRI" -Wait

    Start-Sleep -Seconds 5

    # Assign TeamViewer
    if (Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
        Start-Process -FilePath "C:\Program Files\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY="
    }
    if (Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
        Start-Process -FilePath "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY="
    }

    Start-Sleep -Seconds 2

    # Clean up
    Remove-Item -Path "$PSScriptRoot\TeamViewer_Host.zip" -ErrorAction SilentlyContinue
    Remove-Item -Path "$PSScriptRoot\Host" -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$PSScriptRoot\Full" -Recurse -ErrorAction SilentlyContinue

   

    # Assign TeamViewer
    AssignTeamViewer

     Start-Sleep -Seconds 5
     
    # Assign TeamViewer
    AssignTeamViewer

}



 function selfdestruct {
#Remove-Item $script:MyInvocation.MyCommand.Path -Force
# Exit the current script
Exit
}


# Check if a parameter is supplied
if ($args.Length -eq 0) {
    #Write-Host "No parameter supplied."
} else {
    Write-Host "Forced Install"
    # Check if TeamViewer 15 is installed
    if (Test-Path "C:\Program Files\TeamViewer\TeamViewer15_Logfile.log") {
         Write-Host "TV 15 Present"
         AssignTeamViewer
         selfdestruct
    }
    Install-TV
    selfdestruct
}




# Check if TeamViewer is installed
if (Test-Path "C:\Program Files\TeamViewer\TeamViewer15_Logfile.log") {
     Write-Host "TV 15 Present"
    selfdestruct
}

if ( Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
Uninstal-lTV
Install-TV
selfdestruct
    }

if ( Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
Uninstall-TV
Install-TV
selfdestruct
}

 Write-Host "NO TV : Quit."
 
 selfdestruct
