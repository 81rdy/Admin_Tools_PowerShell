Import-Module ActiveDirectory

$exit = ""
while($exit -ne "q"){
    $fname = Read-Host -Prompt "Enter Users First Name"   
    $lname = Read-Host -Prompt "Enter User Last Name"
    
    $pass  =   ""
    for($i = 1;$i -le 25;$i++){
        $pass_num      =   Get-Random -Minimum 33 -Maximum 127
        $pass_char     =   [char]$pass_num
        $pass          =   $pass+$pass_char
        }
    $pass_secured = ConvertTo-SecureString $pass -AsPlainText -Force

    $fchar = $fname.substring(0, 1)
    echo $fchar
    echo "First Name `t `t `t `t $fname"
    echo "Last Name: `t `t `t `t $lname"
    echo "Login: `t `t `t `t $fchar.$lname"
    echo "generated password: `t $pass"

    # $OUpath = # -Path $OUpath
    New-ADuser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fchar.$lname" -AccountPassword $pass_secured -ChangePasswordAtLogon $False -Enable $true
 
    $exit = Read-Host -Prompt "'q' to quit"
}
