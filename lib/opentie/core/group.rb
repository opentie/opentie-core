module Opentie::Core
  module Group
    extend ActiveSupport::Concern

    included do
      include Mongoid::Document
      include Mongoid::Enum
    end
  end
end
