using namespace System.Management.Automation.Host


$DCSPath=Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | % { Get-ItemProperty $_.PsPath } | Select-Object InstallLocation | Where-Object InstallLocation -Like "*DCS*" | ForEach-Object {$_.InstallLocation}
$TargetPath=Get-ChildItem HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | % { Get-ItemProperty $_.PsPath } | Select-Object InstallLocation | Where-Object InstallLocation -Like "*Thrustmaster*" | ForEach-Object {$_.InstallLocation}
$F16CInput=$DCSPath+"Mods\aircraft\F-16C\Input\F-16C\joystick\"
$UserProfile=[System.Environment]::GetEnvironmentVariable('userprofile')
$BackupDirectory=$null
$BackupDirectory=Test-Path -Path "$UserProfile\SkunkworksBackup\"

if($BackupDirectory -eq $false){New-Item -Path $UserProfile -Name "SkunkworksBackup" -ItemType "directory"}


function New-Menu {
   [CmdletBinding()]
   param(
       [Parameter(Mandatory)]
       [ValidateNotNullOrEmpty()]
       [string]$Title,

       [Parameter(Mandatory)]
       [ValidateNotNullOrEmpty()]
       [string]$Question
   )
   
   $yes = [ChoiceDescription]::new('&Yes', 'Replace default.lua')
   $no = [ChoiceDescription]::new('&No', 'Negative')

   $options = [ChoiceDescription[]]($yes, $no)

  $result = $host.ui.PromptForChoice($Title, $Question, $options, 0)

   switch ($result) {
       0 { 'Yes - Installating' }
       1 { 'No - Skipping...' }
  }

}

function Show-Menu {
    param (
        [string]$Title = "Razzle's Dazzling DCS Script"
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host ""
    Write-Host "Choose your fate..."
    Write-Host ""
    Write-Host "1: Backup stock default.lua"
    Write-Host "2: Overwrite stock F16-C default.lua"
    Write-Host "Q: Press 'Q' to quit."
}

#New-Menu -Title 'F16-C' -Question 'Replace default.lua?'
 

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {'Backing up stock default.lua files';Copy-Item "$F16CInput\default.lua" -Destination $UserProfile\SkunkworksBackup\}
    '2' {"F16C_default.lua has been copied to $F16CInput";Copy-Item ".\F16C_default.lua" -Destination "C:\DCS Mods\temp\"}
        }
    
    pause
    
 }
 until ($selection -eq 'q')
 