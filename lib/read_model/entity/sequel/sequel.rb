module ReadModel::Entity
  module Sequel
    def self.apply(model)
      model.instance_exec do
        self.require_modification = false

        plugin :delay_add_association

        plugin :update_or_create

        plugin :association_proxies do |options|
          if options[:method] == :find_or_new
            arguments = options.fetch :arguments
            block = options[:block]

            associated_class = Object.const_get options[:reflection][:class_name]
            associated_model = associated_class.find_or_new *arguments, &block

            add_method = options[:reflection].add_method

            root_instance = options[:instance]

            root_instance.public_send add_method, associated_model

            true
          else
            false
          end
        end

        unrestrict_primary_key
      end
    end

    module ClassMethods
      def get(id)
        primary_key_name = self.primary_key

        find_or_new primary_key_name => id
      end
    end

    module DatasetMethods
      def find_or_new(*)
        self
      end
    end

    module InstanceMethods
      attr_accessor :marked_for_delete
      alias_method :delete=, :marked_for_delete=

      def save(*)
        if marked_for_delete
          destroy unless new?
        else
          super
        end
      end

      def db=(db)
        @db = db
      end

      def db
        @db or super
      end
    end
  end
end
