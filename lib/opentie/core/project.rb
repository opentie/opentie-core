require_relative 'request'

module Opentie::Core
  module Project
    extend ActiveSupport::Concern

    module ClassMethods
      def request_is(req)
        @request = req
      end

      def request_class
        @request
      end
    end
    
    def available_requests
      self.class.request_class.all_request_types.select do |req|
        req.available? self
      end
    end
  end
end
