$DhcpDomain = ((Get-ItemProperty 'HKLM:SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters').'DhcpDomain')

if ($DhcpDomain -like "*ec2*") {
	$location = "aws"
} else {
	$location = "datacenter"
}
write-host $DhcpDomain
write-host "$location"

if ($location -eq "datacenter") {
	if ($DhcpDomain -like "*MDC1*") {
		$mozspace = "mdc1"
	} elseif ($DhcpDomain -like "*MDC2*") {
		$mozspace = "mdc2"
	} elseif ($DhcpDomain -like "*MTV2*") {
		$mozspace = "mtv2"
	} else {
		$mozspace = "unkown"
	}
}

Write-host location=$location
Write-host mozspace=$mozspace
