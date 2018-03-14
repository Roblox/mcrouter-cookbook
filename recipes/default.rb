#
# Cookbook Name:: mcrouter
# Recipe:: default
#
# Copyright 2015 EverTrue, Inc.
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

include_recipe 'mcrouter::_user'
include_recipe 'mcrouter::_deps_centos' if node['platform'] == 'centos'
include_recipe 'mcrouter::_deps_ubuntu_16.04' if node['platform'] == 'ubuntu' && node['platform_version'].to_f	== 16.04 && node['mcrouter']['install_type'] == 'source'
include_recipe 'memcached::default' if node['mcrouter']['local_memcached']
include_recipe 'mcrouter::_double_conversion'
include_recipe 'mcrouter::_folly'
include_recipe 'mcrouter::_wangle'
include_recipe 'mcrouter::_install'
include_recipe 'mcrouter::configure'
include_recipe 'mcrouter::service'
