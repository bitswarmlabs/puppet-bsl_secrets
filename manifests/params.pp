class bsl_secrets::params {
  $credstash_config_file = '/etc/puppet-credstash.yaml'
  $credstash_region = 'us-east-1'
  $credstash_dynamodb_table = 'credential-store'
  $credstash_encryption_contexts = {
    environment => 'prod',
    app_tier    => 'web',
    product     => 'MyApp',
  }

}
