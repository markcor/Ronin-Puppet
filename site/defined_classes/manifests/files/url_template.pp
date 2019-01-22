# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

define defined_classes::files::url_template ( $pkg, $destination, $package=$title, $creates=[] ) {

$site_source = lockup(site_source)

	file { "$fact(tempdir)\\$file":
		source => "$source:wq!
",
	}

	file { "$target":
		content => epp("$fact(tempdir)\\$file",
	}
}


$pkgdir = lookup('loc_pkg_dir')
$srcloc = lookup('ext_pkg_src')

	file { "$pkgdir\\$pkg":
		source => "$srcloc/$pkg",
	}
	file { "$destination":
		ensure => directory,
	}
	unzip { "$pkg" :
		destination => "$destination",
		creates     => "$creates",
		source      => "$pkgdir\\$pkg",
		require     => File["$pkgdir\\$pkg"],
	}
}

# Bug list
