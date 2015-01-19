require_relative 'form_schema'

module Opentie
  module Core
    module Request
      extend ActiveSupport::Concern

      included do
        # list of all requests / applications
        @all_kinds = []
        
        field :commited, type: Boolean, default: false
        field :created_at, type: Time
        field :updated_at, type: Time
      end

      module ClassMethods
        # helpers for DSL
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

        def inherited(subclass)
          @all_kinds << subclass
        end
        def all_request_types
          @all_kinds
        end
      end
    end
  end
end
