#Copyright Student 105178737 
#Pseudocode included in comments.

#"$Setup" switches is used in place of /s. note that '-s' still works.
[CmdletBinding()]
param (
    [switch] $Setup
)
<#
ATOMD
Check if the sentinel value/clfile Z:\105178737.txt exists (to check if the drive is mounted)
If File exists
	DISMOUNT
		Open path %VERAPATH%
			Use command to dismount Z:\
			

If the file does not exist
	MOUNT
		Open path %VERAPATH%
			Use command to mount Z:\
#>
Function AutoMD{

    $sentinel = Test-Path -Path "Z:\105178737.txt"
    
    
    if ($sentinel -eq $true) {
        & "$env:VERAPATH" /d /letter z /quit
    }
    else {
        
        & "$env:VERAPATH" /volume "C:\Apps\105178737.tc" /letter z /password $env:VERAPASS /quit
    }
    }
<#SETUP_MENU
Print: “Please choose from the following options. Press 1 to search for Veracrypt, Press 2 to change password and press 3 to reset.”
Wait for input
1 is pressed
	Look for “VeraCrypt.exe” in the file system
	If environment variable %VERAPATH% Isn’t made, make it
	Update %VERAPATH% with the executable’s location
	Print “VeraCrypt Successfully Found”
2 is pressed
	Print “Please enter your password:” 
		Wait for input
	Update %VERAPASS% with the password
	Print  “Password Successfully Updated”
3 is pressed
	Delete %VERAPASS%
	Delete %VERAPATH%
	Print  “Password Successfully Updated”
4 is pressed
	GOTO AUTOMD
Else
	Print “ERROR: Please Select from the Following:”
	GOTO SETUP_MENU
#>      
        function StupMenu {
            Write-Output "=========================================================================="
            Write-Output "                                 Menu"
            Write-Output "=========================================================================="
            Write-Output "  "
            Write-Output "Please enter a number for one of the following options."
            Write-Output "1. Locate Veracrypt"
            Write-Output "2. Change Password"
            Write-Output "3. Reset All Options"
            Write-Output "4. Exit and Mount/Dismount"
            $election = Read-Host -Prompt "Please Select..."
            if ($election -eq '1') {
                Lookup
                StupMenu
            }
            elseif ($election -eq '2') {
                Vpass
                StupMenu
            }
            elseif ($election -eq '3') {
                Reset
                StupMenu
            }
            elseif ($election -eq '4') {
                AutoMD
            }
            else {
                Write-Output "ERROR: Please select from the following"
                StupMenu
            }
            }
            
           
            function  Lookup{
                Remove-Item $env:VERAPATH
                $path = Get-ChildItem -Recurse -Path C:\ -Filter VeraCrypt.exe | Select-Object -First 1 -ExpandProperty FullName
                $env:VERAPATH = "$path"
                Clear-Host
                if ($env:VERAPATH) {
                Write-Output "Successfully Located VeraCrypt.exe"
                }
                else {
                Write-Output "Locate Failed!"}
            }
            
            function  Vpass{
                Remove-Item $env:VERAPASS
                Clear-Host
                $pwd_string = Read-Host "Enter a Password" 
                $env:VERAPASS = "$pwd_string"
                Clear-Host
                
                if ($env:VERAPASS) {
                    Write-Output "Successfully updated Password."
                    }
                    else {
                    Write-Output "Password update Failed!"}
            }
            function Reset {
                Remove-Item Env:\VERAPASS
                Remove-Item Env:\VERAPATH
                if ($env:VERAPASS -eq $false -and $env:VERAPATH -eq $false) {
                    Clear-Host
                    Write-Output "Reset Successful."
                    }
                    else {
                        Clear-Host
                        Write-Output "Reset Failed!"}
        }
if ($Setup -eq $true) {
    StupMenu
    } 
elseif ($Setup -eq $false -and ($env:VERAPATH -and $env:VERAPASS) ){
    AutoMD
    }    
else{
    StupMenu
}

