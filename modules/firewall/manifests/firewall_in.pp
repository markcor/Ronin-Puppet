class packages::firewall_in {

	windows_firewall::exception { 'kms_in':
  	ensure       => present,
  	direction    => 'in',
  	action       => 'Allow',
  	enabled      => 'yes',
  	protocol     => 'TCP',
  	local_port   => '1688',
  	remote_port  => 'any',
  	display_name => 'Allow KMS',
  	description  => 'KMS on port 1688'	
	}
}
