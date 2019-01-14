#This Source Code Form is subject to the terms of the Mozilla Public
#License, v. 2.0. If a copy of the MPL was not distributed with this
#file, You can obtain one at http://mozilla.org/MPL/2.0/.

define shared::win_pkg ( $pkg, $package=$title, $install_options=[]) {

$pkgdir = "C:\\windows\\temp"
$srcloc = "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages"

	file { "$pkgdir\\$pkg" :
		source => "$srcloc/$pkg",
	}
	package { "$pkg" :
		ensure  => installed,
		source  => "$pkgdir\\$pkg",
		require => File["$pkgdir\\$pkg"],
	}
}
