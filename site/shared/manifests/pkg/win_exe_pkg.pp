#This Source Code Form is subject to the terms of the Mozilla Public
#License, v. 2.0. If a copy of the MPL was not distributed with this
#file, You can obtain one at http://mozilla.org/MPL/2.0/.

define shared::pkg::win_exe_pkg ( $pkg, $package=$title, $install_options_string=[]) {

$pkgdir = lookup('loc_pkg_dir')
$srcloc = lookup('ext_pkg_src')

	file { "$pkgdir\\$pkg" :
		source => "$srcloc/$pkg",
	}
#	package { "$pkg $install_options_string" :
#		ensure  => installed,
#		source  => "$pkgdir\\$pkg",
#		require => File["$pkgdir\\$pkg"],
#	}
	exec { "$title install":
		command => "$pkgdir\\$pkg $install_options",
	}
}
