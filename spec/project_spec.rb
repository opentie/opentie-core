# coding: utf-8
require_relative 'spec_helper'
require 'rspec'
RSpec.describe Opentie::Core::Project, :type => :model do
  describe "FakeProject" do
    subject(:pr) { FakeProject.new }

    it 'can create instance' do
      expect(pr).to be_an_instance_of FakeProject
    end

    it 'should return available requests' do
      allow(Time).to receive(:now).and_return(Time.local(2015, 5, 4, 10))
      expect(pr.available_requests).to match_array([TestRequest, AnotherTestRequest])

      allow(Time).to receive(:now).and_return(Time.local(2015, 4, 4, 10))
      expect(pr.available_requests).to match_array([TestRequest])

      allow(Time).to receive(:now).and_return(Time.local(2015, 5, 8, 10))
      expect(pr.available_requests).to match_array([AnotherTestRequest])
    end
  end
end
