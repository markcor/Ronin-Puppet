class management_packages {

  include dirs

  file { "C:\\packages\\nxlog-ce-2.9.1716.msi":
    require => File["C:\\packages"],
    ensure  => present,
    source  => 'https://nxlog.co/system/files/products/files/348/nxlog-ce-2.9.1716.msi',
  }
  package { 'nxlog':
    ensure          => installed,
    source          => "C:\\packages\\nxlog-ce-2.9.1716.msi",
		
  }
}
