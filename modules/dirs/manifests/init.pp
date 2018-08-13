class dirs {

	file { "C:\\packages":
		ensure => "directory",
	}
  file { "C:\\logs":
    ensure => "directory",
	}
}
