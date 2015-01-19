# -*- coding: utf-8 -*-
require 'bundler/setup'
require 'rspec'
require 'pry'
require 'database_cleaner'

require 'opentie/core'
Mongoid.load!('./spec/mongoid.yml')

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end

class FakeGroup
  include Opentie::Core::Group
end

class FakeProject < FakeGroup
  include Opentie::Core::Project

  request_class_name_is "FakeRequest"

  yes_no "is_ok", "よいか",
  yes: "よい",
  no: "わるい"

  radio "hoge", "ほげフィールド",
  description: "",
  values: {
    foo: "ふー",
    bar: "ばー",
    baz: "ばず"
  }

  textarea "text", "書け",
  description: "オイ　書け　オラ"
end

class FakeBureau < FakeGroup
  include Opentie::Core::Bureau
end

class FakeRequest
  include Opentie::Core::Request
  
  project_class_name_is "FakeProject"

  #belongs_to :project, class_name: "FakeProject", inverse_of: :requests
end

class TestRequest < FakeRequest
  subject "test request"
  application_period (Time.local 2015, 4, 1, 10)..(Time.local 2015, 5, 5, 10)
  optional false
  in_charge_of :soumu
end

class AnotherTestRequest < FakeRequest
  subject "test request twooo"
  application_period (Time.local 2015, 5, 3, 10)..(Time.local 2015, 6, 1, 10)
  optional false
  in_charge_of :soumu

  field :another_fake_number, type: Integer
  field :another_fake_hash, type: Hash
end
