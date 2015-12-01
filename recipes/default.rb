#
# Cookbook Name:: openssh
# Recipe:: default
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

node["openssh"]["packages"].each do |name|
  package name do
    action :install
  end
end

template node["openssh"]["sysconfig_file"] do
  source "sysconfig.conf.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["openssh"]
  )

  notifies :restart, "service[openssh]"

  not_if do
    node["openssh"]["sysconfig_file"].empty?
  end
end

template node["openssh"]["config_file"] do
  source "sshd_config.conf.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["openssh"]
  )

  notifies :restart, "service[openssh]"

  not_if do
    node["openssh"]["config_file"].empty?
  end
end

template node["openssh"]["keygen_file"] do
  source "keygen.erb"
  owner "root"
  group "root"
  mode 0755

  variables(
    node["openssh"]
  )

  not_if do
    node["openssh"]["keygen_file"].empty?
  end
end

#
# TODO(must): Execute keygen script on host_key change
# TODO(must): Delete all old unused host_key files
#

service "openssh" do
  provider Chef::Provider::Service::Upstart if platform? "ubuntu"

  service_name node["openssh"]["service_name"]
  action [:enable, :start]
end
