require 'mongoid'

module Opentie
  module Core
    class Request
      include Mongoid::Document

      # list of all requests / applications
      @all_kinds = []

      belongs_to :project, inverse_of: :project

      field :commited, type: Boolean, default: false
      field :created_at, type: Time
      field :updated_at, type: Time

      class << self
        # helpers for DSL
        def subject(t)
          @subject = t
        end
        def application_period(t)
          @application_period = t
        end
        def declinable(t)
          @declinable = t
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
