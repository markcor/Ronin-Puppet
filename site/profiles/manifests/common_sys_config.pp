class profiles::common_sys_config {
	# Forge modules
	include ::windowstime

	# Custom modules
	include services::disable_service
	include win_defend::disable_windows_defender

	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}

	if $facts['location'] == 'aws' {
		class { 'windowstime':
 			servers => { '0.pool.ntp.org'     => '0x01',
						 '1.pool.ntp.org'     => '0x01',
						 '2.pool.ntp.org'     => '0x01',
						 '3.pool.ntp.org'     => '0x01',
					  }	
			timezone => 'Greenwich Standard Time',
		}
	}
	if $facts['location'] == 'datacenter' {
		class { 'windowstime':
			servers  => { "infoblox1.private.$facts['mozspace'].mozilla.com" => '0x01',
						}
  			timezone => 'Greenwich Standard Time',
		}
	}
}
