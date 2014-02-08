include common

rbenv::install { 'vagrant':
}

rbenv::compile { '2.1.0':
  user => 'vagrant',
}

class { 'nodejs':
  version => 'v0.10.25',
}

class { 'nginx':
  package_source  => 'passenger',
  http_cfg_append => {
    'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
  }
}

class { '::mysql::server':
  root_password    => ''
}
