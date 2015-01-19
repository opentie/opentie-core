module Opentie::Core
  module Persona
    extend ActiveSupport::Concern

    included do
      include Mongoid::Document
      include Mongoid::Enum
      include FormSchema
    end
  end
end
