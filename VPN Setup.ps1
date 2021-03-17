[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$PublicIP = 'Please Input Public IP Address'

$Title = 'Innovative Cloud Technologies has a Question'
$IP = [Microsoft.VisualBasic.Interaction]::InputBox($PublicIP, $Title);

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')


$PSK   = 'Please Input PreShared Key:'

$Key = [Microsoft.VisualBasic.Interaction]::InputBox($PSK, $Title);



Add-VpnConnection -Name "VPN" -ServerAddress "$IP" -TunnelType "L2tp" -EncryptionLevel "optional" -AuthenticationMethod MSChapv2, Chap -SplitTunneling -AllUserConnection -PassThru -L2tpPsk "$Key" -RememberCredential

cmd.exe /c REG ADD HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent /v AssumeUDPEncapsulationContextOnSendRule /t REG_DWORD /d 0x2 /f