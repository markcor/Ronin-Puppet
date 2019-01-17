# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_sys_config {

	# Forge modules

	# Custom modules
	include win_defend::disable_windows_defender
	include win_update::disable_windows_update

	# Firewall
	windows::firewall_rule { 'ICMP Ping':
  		protocol => 'icmpv4:8,any',
	}

	# Services 
	$disbaled_services = ["wsearch", "VSS", "puppet"]

	win_services::disable_service { $disbaled_services :
	}

	# Registry 
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
		content => $facts['env_programdata'],
	}
}

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1515779

#services
#  https://bugzilla.mozilla.org/show_bug.cgi?id=1510759
 
# win_defend
# https://bugzilla.mozilla.org/show_bug.cgi?id=1512435i

# win_update
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510756
