# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::hardware_common_sys_config {

# User
$adminpw = hiera('adminpw')

# NTP
	class { 'windowstime':
		servers  => { "infoblox1.private.$facts['mozspace'].mozilla.com"     => '0x08'}, 
		timezone => 'Greenwich Standard Time',
	}

# User
	user { 'administrator' :
		ensure => present,
		password => "$adminpw",
	}
}

# Bug list
# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1515777

# NTP 
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510754

# User
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510830
