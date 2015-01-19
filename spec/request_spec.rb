# coding: utf-8
require_relative 'spec_helper'

RSpec.describe Opentie::Core::Request do
  describe "TestRequest" do
    subject(:tr) { TestRequest.new }

    it 'can be inherited' do
      expect(tr).to be_an_instance_of TestRequest
    end
  end
end
