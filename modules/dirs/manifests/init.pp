class base_dir {

	file { "C:\\packages":
		ensure => "directory",
	}
  file { "C:\\logs":
    ensure => "directory",
	}
}
