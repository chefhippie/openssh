#
# Cookbook Name:: openssh
# Attributes:: default
#
# Copyright 2013, Thomas Boerger
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
  "ubuntu" => %w(
    openssh-client
    openssh-server
  ),
  "suse" => %w(
    openssh
  )
)
default["openssh"]["service_name"] = value_for_platform_family(
  "debian" => "ssh",
  "ubuntu" => "ssh",
  "suse" => "sshd"
)
default["openssh"]["service_options"] = ""
default["openssh"]["sysconfig_file"] = value_for_platform_family(
  "debian" => "/etc/default/ssh",
  "ubuntu" => "/etc/default/ssh",
  "suse" => "/etc/sysconfig/ssh"
)
default["openssh"]["config_file"] = "/etc/ssh/sshd_config"
default["openssh"]["listen"] = "0.0.0.0"
default["openssh"]["port"] = "22"
