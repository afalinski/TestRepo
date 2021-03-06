﻿# Silent install Adobe Reader DC
# https://get.adobe.com/nl/reader/enterprise/
 
# Path for the workdir
$workdir = "c:\installer\"
 
# Check if work directory exists if not create it
 
If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
else
{ New-Item -Path $workdir  -ItemType directory }
 
# Download the installer
 
$source = "https://vmextensionsblob.blob.core.windows.net/test/KcsSetup_Dismon.exe"
$destination = "$workdir\KcsSetup_Dismon.exe"
 
# Check if Invoke-Webrequest exists otherwise execute WebClient
 
if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}