#This Source Code Form is subject to the terms of the Mozilla Public
#License, v. 2.0. If a copy of the MPL was not distributed with this
#file, You can obtain one at http://mozilla.org/MPL/2.0/.

define shared::pkg::win_exe_pkg ( $pkg, $package=$title, $install_options_string=[]) {

include shared::dirs::win_ronin_dirs

$pkgdir       = lookup('loc_pkg_dir')
$srcloc       = lookup('ext_pkg_src')
$semaphoredir = "facts['roninsemaphoredir']"

	file { "$pkgdir\\$pkg" :
		source => "$srcloc/$pkg",
	}
	exec { "$title install":
		require => File["C:\\ProgramData\\PuppetLabs\\ronin\\semaphore"],
		command => "$pkgdir\\$pkg $install_options_string",
		creates => "$semaphoredir\\$pkg",
		notify   => File["$semaphoredir\\$pkg"],
	}
	file { "$semaphoredir\\$pkg":
		ensure => present,
	}
}
