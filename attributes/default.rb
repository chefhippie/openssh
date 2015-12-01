#
# Cookbook Name:: openssh
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["openssh"]["packages"] = value_for_platform_family(
  "debian" => %w(
    openssh-client
    openssh-server
  ),
  "suse" => %w(
    openssh
  )
)

default["openssh"]["service_name"] = value_for_platform_family(
  "debian" => "ssh",
  "suse" => "sshd"
)
default["openssh"]["service_options"] = ""

default["openssh"]["sysconfig_file"] = value_for_platform_family(
  "debian" => "/etc/default/ssh",
  "suse" => "/etc/sysconfig/ssh"
)

default["openssh"]["config_file"] = "/etc/ssh/sshd_config"
default["openssh"]["keygen_file"] = "/usr/sbin/sshd-gen-keys-start"
default["openssh"]["listen"] = "0.0.0.0"
default["openssh"]["port"] = "22"

default["openssh"]["permit_root_login"] = "yes"
default["openssh"]["rsa_authentication"] = "yes"
default["openssh"]["pubkey_authentication"] = "yes"
default["openssh"]["strict_modes"] = "yes"
default["openssh"]["ignore_rhosts"] = "yes"
default["openssh"]["password_authentication"] = "yes"
default["openssh"]["x11_forwarding"] = "yes"
default["openssh"]["print_last_log"] = "yes"
default["openssh"]["tcp_keep_alive"] = "yes"
default["openssh"]["use_pam"] = "yes"
default["openssh"]["challenge_response_authentication"] = "no"
default["openssh"]["allow_agent_forwarding"] = "yes"
default["openssh"]["allow_tcp_forwarding"] = "yes"
default["openssh"]["x11_use_localhost"] = "yes"
default["openssh"]["use_dns"] = "yes"
default["openssh"]["rhost_rsa_authentication"] = "no"
default["openssh"]["hostbased_authentication"] = "no"
default["openssh"]["ignore_user_known_hosts"] = "no"
default["openssh"]["permit_empty_passwords"] = "no"
default["openssh"]["permit_user_environment"] = "no"
default["openssh"]["permit_tunnel"] = "no"
default["openssh"]["print_motd"] = "no"
default["openssh"]["gateway_ports"] = "no"
default["openssh"]["use_login"] = "no"

default["openssh"]["host_keys"] = %w(
  /etc/ssh/ssh_host_ed25519_key
  /etc/ssh/ssh_host_rsa_key
)

default["openssh"]["kex_algorithms"] = %w(
  curve25519-sha256@libssh.org
  diffie-hellman-group-exchange-sha256
)

default["openssh"]["macs"] = %w(
  hmac-sha2-512-etm@openssh.com
  hmac-sha2-256-etm@openssh.com
  hmac-ripemd160-etm@openssh.com
  umac-128-etm@openssh.com
  hmac-sha2-512
  hmac-sha2-256
  hmac-ripemd160
  umac-128@openssh.com
)

default["openssh"]["ciphers"] = %w(
  chacha20-poly1305@openssh.com
  aes256-gcm@openssh.com
  aes128-gcm@openssh.com
  aes256-ctr
  aes192-ctr
  aes128-ctr
)
