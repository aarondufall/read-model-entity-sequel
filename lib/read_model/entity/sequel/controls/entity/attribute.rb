module ReadModel::Entity::Sequel
  module Controls
    module Entity
      module Attribute
        def self.example(stream_version=nil)
          stream_version ||= 0

          "some-value-#{stream_version}"
        end
      end
    end
  end
end
