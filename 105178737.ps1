<#Part 1#>

#Check if the /s or Setup switches exist
param(
     $Setup
)

        if ($Setup -eq $true) {
           do {Show-StupMenu} until ($env:VERAPATH ) 
        } 
        else {
            <# Action when all if and elseif conditions are false #>

<#AUTO
    Check if environment variables %VERAPATH and %VERAPASS is there
         If BOTH %VERAPASS and %VERAPATH are there,
             GOTO ATOMD

    If none or only one of %VERAPASS and %VERAPATH are there,#>
    Get-Item $env:VERAPATH
    Get-Item $env:VERAPASS
    ($env:VERAPATH -eq $true) -and ($env:VERAPASS -eq $true)
    AutoMD
    
        }
Function StupMenu{
echo "=========================================================================="
echo "                                 Menu"
echo "=========================================================================="
echo "Please enter a number for one of the following options."
echo "1. Locate Veracrypt"
echo "2. Change Password"
echo "3. Reset All Options"
echo "4. Continue to "
echo "Current Veracrypt location is: $env:VERAPATH"
echo "Current Password is: $env:VERAPASS"

}



#Write-Output $env:VERAPATH
#Write-Output $env:VERAPASS

function Reset {
    param (
        OptionalParameters
    )
    Remove-Item $env:VERAPASS
    Remove-Item $env:VERAPATH
}









<#PART 2#>

<#
    AUTOMD (Auto mount/dismount)
    Pseudocode is as follows
    Check if the file Z:\105178737.txt exists (to check if the drive is mounted)
        If File exists
            DISMOUNT
                Open path %VERAPATH%
                    Use command to dismount Z:\
                    

        If the file does not exist
            MOUNT
                Open path %VERAPATH%
                    Use command to mount Z:\

#>
<#define the path as a sentinel value#>
Function AutoMD{

$sentinel = Test-Path -Path "Z:\105178737.txt"


if ($sentinel -eq $true) {
    & "C:\Apps\VeraCrypt.exe" /d /letter z /quit
}
else {
    
    & "C:\Apps\VeraCrypt.exe" /volume "C:\Apps\105178737.tc" /letter z /password 105178737 /quit
}
}