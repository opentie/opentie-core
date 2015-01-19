module Opentie::Core
  module Account
    extend ActiveSupport::Concern
    
    included do
      include Mongoid::Document
      include Mongoid::Enum

      field :auth_token, type: Hash
    end
  end
end
