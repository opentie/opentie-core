module Opentie::Core
  module FormSchema
    extend ActiveSupport::Concern

    class IllDefinedField < StandardError; end

    included do
      class_attribute :schema
      self.schema = []
    end

    module ClassMethods
      def radio(name, title, options)
        schema = create_schema(name, title, :radio, { values: {} }, options)

        raise IllDefinedField, "there must be least 2 values" if schema[:values].length < 2

        form_field :enum, schema
      end

      def yes_no(name, title, options)
        raise IllDefinedField, "field `yes` must be specified" if options[:yes].nil?
        raise IllDefinedField, "field `no` must be specified" if options[:no].nil?

        options[:values] = { yes: options[:yes], no: options[:no] }

        radio(name, title, options)
      end

      def checkbox(name, title, options)
        schema = create_schema(name, title, :checkbox,
                               { value: nil, label: nil }, options)

        raise IllDefinedField, "value must be specified" if schema[:value].nil?
        raise IllDefinedField, "label must be specified" if schema[:label].nil?

        form_field Boolean, schema
      end

      def textarea(name, title, options)
        schema = create_schema(name, title, :textarea, { default: '' }, options)

        form_field String, schema
      end

      def text(name, title, options)
        schema = create_schema(name, title, :text, { default: '' }, options)

        form_field String, schema
      end

      private

      def create_schema(name, title, type, additional, options)
        schema = { name: name, type: type, title: title }
        {
          description: "",
          required: true, 
          validation: []
        }.merge(additional).each {|sym, default|
          if options[sym].nil?
            schema[sym] = default
          else
            schema[sym] = options[sym]
          end
        }
        schema
      end

      def form_field(type, options)
        schema << options

        if type == :enum
          enum options[:name], options[:values].keys
        else
          field options[:name], type: type, default: options[:default]
        end
      end
    end
  end
end
