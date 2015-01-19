module Opentie::Core
  module Project
    extend ActiveSupport::Concern

    included do
      include FormSchema
    end

    module ClassMethods
      def request_class_name_is(class_name)
        @request_class_name = class_name
        has_many :requests, class_name: class_name, inverse_of: :project
      end

      def request_class
        @request_class ||= @request_class_name.constantize
      end
    end
    
    def available_requests
      self.class.request_class.all_request_types.select do |req|
        req.available? self
      end
    end
  end
end
