require_relative 'request'

module Opentie::Core
  module Project
    extend ActiveSupport::Concern
    
    def available_requests
      Opentie::Core::Request.all_request_types.select do |req|
        req.available? self
      end
    end
  end
end
