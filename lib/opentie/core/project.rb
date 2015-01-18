require_relative 'request'

module Opentie
  module Core
    class Project < Group
      def available_requests
        Opentie::Core::Request.all_request_types.select do |req|
          req.available? self
        end
      end
    end
  end
end
