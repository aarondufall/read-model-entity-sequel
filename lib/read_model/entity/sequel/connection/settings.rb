module ReadModel::Entity
  module Sequel
    class Connection
      class Settings < ::Settings
        def self.data_source
          'settings/read_model_connection.json'
        end
      end
    end
  end
end
