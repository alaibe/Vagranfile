include common

rbenv::install { 'vagrant':
}

rbenv::compile { '2.1.0':
  user => 'vagrant',
  global => true,
}

class { 'nvm_nodejs':
  user    => 'vagrant',
  version => '0.10.25',
}

class { 'nginx':
}

class { '::mysql::server':
}
