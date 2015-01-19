# -*- coding: utf-8 -*-
require 'bundler/setup'
require 'rspec'
require 'opentie/core'
require 'mongoid'
Mongoid.load!('./spec/mongoid.yml')
require 'mongoid/enum'

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class FakeGroup
  include Mongoid::Document
  include Mongoid::Enum
  include Opentie::Core::Group
  include Opentie::Core::FormSchema
end

class FakeBureau < FakeGroup
  include Opentie::Core::Bureau
end

class FakeRequest
  include Mongoid::Document
  include Mongoid::Enum
  include Opentie::Core::Request
  include Opentie::Core::FormSchema

  belongs_to :project, class_name: 'FakeProject', inverse_of: :requests
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

class FakeProject < FakeGroup
  include Opentie::Core::Project

  request_is FakeRequest

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

  has_many :requests, class_name: 'FakeRequest', inverse_of: :project
end
