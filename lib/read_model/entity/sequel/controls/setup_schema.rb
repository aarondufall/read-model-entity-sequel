module ReadModel::Entity::Sequel
  module Controls
    module SetupSchema
      def self.call
        connection = ReadModel::Entity::Sequel::Connection.get

        connection.create_table! TableName.example do
          String :id, :primary_key => true
          String :some_attribute, :null => false
          Integer :events_applied
        end

        connection.create_table! TableName::Association.example do
          String :id, :primary_key => true
          String :example_id, :null => false, :index => true
          String :association_attribute, :null => false
        end
      end
    end
  end
end
