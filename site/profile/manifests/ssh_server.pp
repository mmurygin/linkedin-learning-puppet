class profile::ssh_server {
  package { 'openssh-server':
    ensure => installed,
  }

  service { 'sshd':
    hasstatus => true,
    enable    => true,
    ensure    => running,
  }

  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCfB1zkh3k9J3LmysYFBUecBl7G6sRY5RSVCWflLtr8A9HOzcbKJJoAoN+M2TlA5neqx1ZNI8sEZgCMBruyfTvlpFZy0Yqaq4H3OHiEZg3jUixeIdCNQ7jLfz4KPizYn8ko7U9tGih4CoABr7eGqvfKDY9BioRYSxG7SKdrkT9wG6MJaw4RouSehbKco5PUrkfjmbl0tJEYYKw2TbnWjfX6nCSKMQCc1q6/zb98w28x2qQ90z7c1rsy2+vVbOiBhXZMRZE4rHQh7ZpRd7/+Wdrz/smm4Kdlox70hsWyNcwbWv8aEiAcx24FZEXV5c4MgkKL8Y/9++0zmKilheUXMWeD',
  }
}
