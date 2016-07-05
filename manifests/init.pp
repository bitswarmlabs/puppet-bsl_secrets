# Class: bsl_secrets
# ===========================
#
# Full description of class bsl_secrets here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'bsl_secrets':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class bsl_secrets (
  $config_file                 = $bsl_secrets::params::credstash_config_file,
  $aws_region                  = $bsl_secrets::params::credstash_region,
  $aws_dynamodb_table          = $bsl_secrets::params::credstash_dynamodb_table,
  $aws_kms_encryption_contexts = $bsl_secrets::params::credstash_encryption_contexts,
) inherits bsl_secrets::params {
  class { '::credstash': }

  validate_hash($aws_kms_encryption_contexts)

  file { $config_file:
    ensure => file,
    content => template('bsl_core/puppet-credstash.yaml.erb')
  }
}
