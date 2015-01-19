# coding: utf-8
require_relative 'spec_helper'

RSpec.describe Opentie::Core::Project, :type => :model do
  describe "FakeProject" do
    subject(:pr) { FakeProject.new }

    it 'can create instance' do
      expect(pr).to be_an_instance_of FakeProject
    end
  end
end
