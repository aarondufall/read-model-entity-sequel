module ReadModel::Entity
  module Sequel
    class Connection
      class AdjustedLogger
        attr_reader :logger

        def initialize(logger)
          @logger = logger
        end

        def debug(*arguments, &block)
          logger.trace(*arguments, &block)
        end

        def info(*arguments, &block)
          logger.debug(*arguments, &block)
        end

        def method_missing(method_name, *arguments, &block)
          logger.public_send method_name, *arguments, &block
        end

        def respond_to_missing?
          true
        end
      end
    end
  end
end
