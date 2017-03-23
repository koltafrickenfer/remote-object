function remote-object{

param( $computername, $scriptblock, $cred )

$session = New-PSSession  -ComputerName $computername -Credential $cred
$rso = Invoke-Command -session $session -ScriptBlock $scriptblock
 
# removes propetie added on by the Invoke-command cmdlet.
$rso | %{$_.PSObject.Properties.Remove('PSComputerName')}
$rso

}
