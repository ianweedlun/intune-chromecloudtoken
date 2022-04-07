#Set variables as input for the script
$KeyPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"
$KeyName = "CloudManagementEnrollmentToken"

#Verify if the registry path already exists
if(Test-Path $KeyPath) {
    if (((Get-ItemProperty $KeyPath).$KeyName)) {
        Write-Host "Key present"
        exit 0
    }
    else {
        Write-Host "Key missing"
        exit 1
    }    
}
else {
    Write-Host "Chrome not installed"
    exit 1
}