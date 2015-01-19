# coding: utf-8
require_relative 'spec_helper'
require 'rspec'
RSpec.describe Opentie::Core::Project, :type => :model do
  describe "FakeProject" do
    subject(:project) { FakeProject.new }

    it 'can create instance' do
      expect(project).to be_an_instance_of FakeProject
    end

    it 'should return available requests' do
      allow(Time).to receive(:now).and_return(Time.local(2015, 5, 4, 10))
      expect(project.available_requests).to match_array([TestRequest, AnotherTestRequest])

      allow(Time).to receive(:now).and_return(Time.local(2015, 4, 4, 10))
      expect(project.available_requests).to match_array([TestRequest])

      allow(Time).to receive(:now).and_return(Time.local(2015, 5, 8, 10))
      expect(project.available_requests).to match_array([AnotherTestRequest])
    end

    it "should has many requests" do
      project.save
      expect(project.requests.length).to eq 0

      project.requests << TestRequest.new
      expect(project.requests.length).to eq 1
      project.requests << TestRequest.new
      expect(project.requests.length).to eq 2

      #expect(project.save).to eq true

      #binding.pry
      expect(TestRequest.count).to eq 2
      expect(FakeProject.first.requests.length).to eq 2
    end
  end
end
