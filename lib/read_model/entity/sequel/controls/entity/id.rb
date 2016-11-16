module ReadModel::Entity::Sequel
  module Controls
    module Entity
      module ID
        def self.example(stream_version=nil)
          stream_version ||= 0

          Controls::ID.example stream_version
        end
      end
    end
  end
end
