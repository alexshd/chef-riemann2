#
# Cookbook Name:: riemann2
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'riemann2::tools' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the `build-essential` recipe' do
      expect(chef_run).to include_recipe('build-essential')
    end

    it 'includes the `runit` recipe' do
      expect(chef_run).to include_recipe('runit')
    end

    it 'installs a chef_gem `riemann-tools` with attributes' do
      expect(chef_run).to install_chef_gem('riemann-tools').with(compile_time: false)
      expect(chef_run).to_not install_chef_gem('riemann-tools').with(compile_time: true)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
