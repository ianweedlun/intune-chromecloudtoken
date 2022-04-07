 <#
.SYNOPSIS
    Configure the Google Chrome Cloud Management enrollment token.
.DESCRIPTION
    This script adds a registry key that will set the Google Chrome Cloud Management enrollment token to enable the cloud-based management of the browser.
.NOTES
    Author: Peter van der Woude
    Contact: pvanderwoude@hotmail.com
    Date published: 22-04-2020
    Current version: 1.0
.LINK
    http://www.petervanderwoude.nl
.EXAMPLE
    Set-ChromeEnrollmentToken.ps1
#>

#Set variables as input for the script
$KeyPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"
$KeyName = "CloudManagementEnrollmentToken"
$KeyValue = "YourEnrollmentToken"

#Verify if the registry path already exists
if(!(Test-Path $KeyPath)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}

#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath).$KeyName)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath -Name $KeyName -Value $KeyValue
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
} 