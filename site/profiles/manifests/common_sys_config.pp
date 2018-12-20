class profiles::common_sys_config {
	# Bug list:
	# https://bugzilla.mozilla.org/show_bug.cgi?id=1510834
	# Forge modules

	# Custom modules
	include services::disable_service
	include win_defend::disable_windows_defender
	include win_update::disable_windows_update

	# Firewall
	windows::firewall_rule { 'ICMP Ping':
  		protocol => 'icmpv4:8,any',
	}

	# Registry 
	# Set high performance power plan
	registry::value { 'PreferredPlan':
		key  => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\explorer\ControlPanel\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}',
		type => string,
		data => '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c',
	}
	# Turn off system restore
	# Can not use the registry::value becuase 'DisableConfig" is common value that is used else where. 
	registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore':
    	ensure => present,
	}
	registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig':
  		ensure     => present,
  		type       => dword,
  		data       => "1",
	}

	# Place to test facts
	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}
}
