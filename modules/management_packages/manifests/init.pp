class management_packages {

  package { 'nxlog':
    ensure          => 'installed',
    source          => 'https://nxlog.co/system/files/products/files/348/nxlog-ce-2.9.1716.msi',
  }
}
