# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

define defined_classes::files::config_template ( $application, $target, $template ) {

$source = lookup(conf_file_src)
$tmpdir = lookup(loc_tmp)

	file { "$tmpdir\\$template":
		source => "$source/$application/templates/$template",
	}
	file { "$target":
		content => epp("$tmpdir\\$template"),
		require => File["$tmpdir\\$template"],
	}
}
