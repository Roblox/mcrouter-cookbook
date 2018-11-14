
default['mcrouter']['install_dir'] = '/usr/local/mcrouter'
default['mcrouter']['user'] = 'mcrouter'
default['mcrouter']['version-branch'] = 'release-36-0'
default['mcrouter']['install_type'] = 'source' # use 'package' to install pre-compiled packages
default['mcrouter']['packages'] = {
  mcrouter: {},
  folly: {},
  wangle: {},
  'double-conversion' => {}
}

# Specific version of double conversion https://github.com/facebook/mcrouter/blob/master/mcrouter/scripts/recipes/folly.sh#L26
default['mcrouter']['double_conversion_commit_hash'] = 'ea970f69edacf66bd3cba2892be284b76e9599b0'
default['mcrouter']['folly_commit_hash'] = 'a1abbb7abcb259acbd94d0d0929b79607a8ce806'
default['mcrouter']['wangle_commit_hash'] = 'a5503c88e1d6799dcfb337caf09834a877790c92'

default['mcrouter']['deps_centos']['automake']['source'] = 'http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/x86_64/os/Packages/a/automake-1.15-4.fc23.noarch.rpm'
default['mcrouter']['deps_centos']['automake']['checksum'] = 'cef878bfcfbd2115bd5cd95f2120f4bfdff30a262289cb83b1e2573eb77b4d91'

default['mcrouter']['local_memcached'] = true
default['memcached']['port'] = 11_811
default['memcached']['udp_port'] = 11_811

default['mcrouter']['cli_opts'] = {
  'port'        => 11_211,
  'config-file' => '/etc/mcrouter/mcrouter.json',
  'async-dir'   => '/var/spool/mcrouter',
  'log-path'    => '/var/log/mcrouter/mcrouter.log',
  'stats-root'  => '/var/mcrouter/stats'
}

default['mcrouter']['limits'] = {
  # nproc: 81_920,
  # nfile: 4096
}

default['mcrouter']['config'] = {
  'pools' => {
    'A' => {
      'servers' => [
        '0.0.0.0:11811'
      ]
    }
  },
  'route' => 'PoolRoute|A',
}
