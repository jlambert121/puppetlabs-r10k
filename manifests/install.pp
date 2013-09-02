# == Class: r10k
#
# This module manages the the r10k package
#
#
class r10k::install(
  $ensure           = 'present',
  $package_provider = 'gem',
  $package_name     = 'r10k',
) {

  package { $package_name:
    ensure   => $ensure,
    provider => $package_provider,
  }

}
