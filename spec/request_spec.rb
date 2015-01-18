# coding: utf-8
require_relative 'spec_helper'

RSpec.describe Opentie::Core::Request do
  describe "TestRequest" do
    class TestRequest < Opentie::Core::Request
      subject "test request"
      application_period (Time.local 2015, 4, 1, 10)..(Time.local 2015, 5, 1, 10)
      declinable false
      in_charge_of :soumu

      field :fake_number, type: Integer
      field :fake_text, type: String
      field :fake_array, type: Array
    end
    class AnotherTestRequest < Opentie::Core::Request
      subject "test request twooo"
      application_period (Time.local 2015, 5, 3, 10)..(Time.local 2015, 6, 1, 10)
      declinable true
      in_charge_of :soumu

      field :another_fake_number, type: Integer
      field :another_fake_hash, type: Hash
    end

    subject(:tr) { TestRequest.new }

    it 'can be inherited' do
      expect(tr).to be_an_instance_of TestRequest
    end
  end
end
