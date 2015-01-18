require 'mongoid'
require_relative 'message'

module Opentie
  module Core
    class Message
      include Mongoid::Document

      has_one :persona, as: :from
      has_one :persona, as: :to

      has_one :message, as: :in_reply_to
      belongs_to :message

      field :created_at, type: Time

      field :subject, type: String
      field :body, type: String

      def get_thread
        Message.find _id: self._id
      end
    end
  end
end
