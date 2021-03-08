class minecraft (
  $url = "https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar",
  $install_dir = "/opt/minecraft",
){
  file { $install_dir:
    ensure =>  directory,
  }

  file { "${install_dir}/minecraft_server.jar":
    source => $url,
    ensure => file,
    before => Service['minecraft'],
  }

  package { 'java':
    ensure => present,
  }

  file { "${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }

  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => epp('minecraft/minecraft.service', {
      install_dir =>  $install_dir,
    })
  }

  service { 'minecraft':
    enable  => true,
    ensure  => running,
    require =>  [Package['java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']]
  }
}
