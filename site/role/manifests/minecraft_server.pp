class role::minecraft_server {
  include profile::base
  include profile::minecraft
  include profile::ssh_server
}
