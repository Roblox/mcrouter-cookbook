#
# Cookbook Name:: mcrouter
# Recipe:: _build_deps.centos.rb
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
include_recipe 'build-essential'
include_recipe 'yum'
include_recipe 'yum-epel'

if node['mcrouter']['install_type'] == 'source'
  cache_dir = Chef::Config[:file_cache_path]

  %w(
    autoconf
    binutils-devel
    bison
    boost
    boost-devel
    cmake
    double-conversion-devel
    flex
    git
    gflags-devel
    glog-devel
    jemalloc-devel
    libtool
    libevent-devel
    make
    openssl-devel
    python-devel
    ragel
  ).each do |pkg|
    package pkg
  end

  remote_file "#{cache_dir}/automake-1.15-4.fc23.noarch.rpm" do
    source node['mcrouter']['deps_centos']['automake']['source']
    checksum node['mcrouter']['deps_centos']['automake']['checksum']
  end

  rpm_package 'automake-1.15-4.fc23.noarch.rpm' do
    source "#{cache_dir}/automake-1.15-4.fc23.noarch.rpm"
    not_if "rpm -qa | grep -qx 'automake-1.15-4.fc23.noarch'"
  end

  magic_shell_environment 'CC' do
    value '/opt/rh/devtoolset-4/root/usr/bin/gcc'
  end

  magic_shell_environment 'CXX' do
    value '/opt/rh/devtoolset-4/root/usr/bin/c++'
  end
else
  %w(
    boost
    flex
    libevent
    bison
    ragel
    snappy
    gflags
    glog
  ).each do |pkg|
    package pkg
  end
end
