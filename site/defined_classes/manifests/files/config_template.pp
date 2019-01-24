# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

define defined_classes::files::config_template ( $application, $target, $template ) {

$source = fact[$local_site_dir]\\configuration
$tmpdir = lookup(loc_tmp)

	file { "$target":
		content => epp("configuration\\templates\\$application\\$template"),
	}
}
