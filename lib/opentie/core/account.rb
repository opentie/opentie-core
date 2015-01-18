require 'mongoid'

module Opentie
  module Core
    class Account
      include Mongoid::Document

      belongs_to :persona, inverse_of: :accounts

      field :auth_token, type: Hash
    end
  end
end
