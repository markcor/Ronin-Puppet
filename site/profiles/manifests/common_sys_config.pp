class profiles::common_sys_config {
	# Bug list:
	# https://bugzilla.mozilla.org/show_bug.cgi?id=1510834
	# Forge modules

	# Custom modules
	include services::disable_service
	include win_defend::disable_windows_defender
	include win_update::disable_windows_update

	# Firewall
	

	# Registry 
	# Set high performance power plan
	registry::value { 'PreferredPlan':
		key  => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\explorer\ControlPanel\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}',
		type => string,
		data => '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c',
	}
	# Turn off system restore
	registry::value { 'DisableConfig':
		key  => 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore',
		type => dword,
		data => '1',
	}

	# Place to test facts
	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}
}
