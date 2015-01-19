module Opentie::Core
  module Account
    extend ActiveSupport::Concern
    
    included do
      field :auth_token, type: Hash
    end
  end
end
