#
# Cookbook Name:: riemann2
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'riemann2::dash' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the `other` recipe' do
      expect(chef_run).to include_recipe('runit')
    end

    it 'includes the `other` recipe' do
      expect(chef_run).to include_recipe('riemann2::infra')
    end

    it 'creates a directory with attributes' do
      expect(chef_run).to create_directory('/opt/riemann2/dash').with(
        user: 'riemann',
        group: 'riemann',
      )

      expect(chef_run).to_not create_directory('/tmp/with_attributes').with(
        user: 'bacon',
        group: 'fat',
      )
    end
    # it 'creates a template with attributes' do
    # expect(chef_run).to create_template('/opt/riemann2/dash/config.rb')
    # end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
