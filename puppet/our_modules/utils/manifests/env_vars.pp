define utils::env_vars (
  $module,
  $lines
) {

  $modules = {
    backend => lookup('backend_app_profile::deploy_directory')
  }
  $user = lookup('backend_app_profile::user')
  $module_path = $modules[$module]
  $env_file = "${module_path}/shared/.env"

  if !defined(File[$env_file]) {
    file { $env_file:
      ensure  => present,
      mode    => '0644',
      owner   => $user,
      content => '# Env file managed by Puppet',
    }
  }

  $lines.each |$env_key, $env_value| {
    file_line { "${module}_${env_key}_env_file":
      ensure => present,
      path   => $env_file,
      line   => "export ${env_key.upcase}=${env_value}"
    }
  }
}