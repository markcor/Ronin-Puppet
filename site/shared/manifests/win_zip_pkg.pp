#This Source Code Form is subject to the terms of the Mozilla Public
#License, v. 2.0. If a copy of the MPL was not distributed with this
#file, You can obtain one at http://mozilla.org/MPL/2.0/.

define shared::win_zip_pkg ( $pkg, $package=$title, $creates=[] ) {

$pkgdir = lookup('loc_pkg_dir')
$srcloc = lookup('ext_pkg_src')

	file { "$pkgdir\\$pkg" :
		source => "$srcloc/$pkg",
	}
	unzip { "$pkg" :
		creates => "$creates",
		source => "$pkgdir\\$pkg",
		require => File["$pkgdir\\$pkg"],
	}
}
