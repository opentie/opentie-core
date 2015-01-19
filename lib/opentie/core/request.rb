module Opentie::Core
  module Request
    extend ActiveSupport::Concern

    included do
      include Mongoid::Document
      include Mongoid::Enum
      include FormSchema

      @inherited = method(:inherited)
      def self.inherited(subclass)
        @inherited.call subclass
        inherited_hook subclass
      end

      # list of all requests / applications
      @all_kinds = []
      
      field :commited, type: Boolean, default: false
      field :created_at, type: Time
      field :updated_at, type: Time
    end

    module ClassMethods
      def project_class_name_is(class_name)
        belongs_to :project, class_name: class_name, inverse_of: :requests
      end

      def subject(t)
        @subject = t
      end

      def application_period(t)
        @application_period = t
      end

      def optional(t)
        @optional = t
      end

      def in_charge_of(t)
        @in_charge_of = t
      end

      def available? (project)
        @application_period.cover? Time.now
      end

      def inherited_hook(subclass)
        @all_kinds << subclass
      end

      def all_request_types
        @all_kinds
      end
    end
  end
end
