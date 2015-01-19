module Opentie::Core
  module Message
    extend ActiveSupport::Concern

    included do
      include Mongoid::Document
      include Mongoid::Enum

      field :created_at, type: Time

      field :subject, type: String
      field :body, type: String
    end

    def get_thread
      Message.find _id: self._id
    end
  end
end
