module ReadModel::Entity
  module Sequel
    class Connection
      include PostgreSQL::Connector

      def specialize(connection)
        adjusted_logger = AdjustedLogger.new logger

        connection.loggers << adjusted_logger

        adjusted_logger
      end

      def self.configure_connection(receiver, db_connection: nil, attr_name: nil)
        attr_name ||= :db_connection

        db_connection ||= get

        receiver.public_send "#{attr_name}=", db_connection

        db_connection
      end

      def self.get
        instance.connection
      end

      def self.connect
        instance.connect
      end

      def self.settings
        Settings.build
      end
    end
  end
end
