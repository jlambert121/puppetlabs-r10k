# == Class: r10k
#
# This module manages system specific settings
#
#
class r10k::params {

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      case $::lsbdistcodename {
        'squeeze', 'lucid': {
          $r10k_bin = '/var/lib/gems/1.8/bin/r10k'
        }
        'precise', 'wheezy': {
          $r10k_bin = '/usr/local/bin/r10k'
        }
        default: {
          fail("Unsupported OS: ${::operatingsystem} (${::lsbdistcodename})")
        }
      }
    } #Debin/Ubuntu
    'CentOS', 'Redhat', 'Fedora', 'Scientific', 'Amazon': {
      $r10k_bin = '/usr/bin/r10k'
    }
    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
