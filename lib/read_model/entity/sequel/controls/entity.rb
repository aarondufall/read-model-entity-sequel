module ReadModel::Entity::Sequel
  module Controls
    module Entity
      def self.example(stream_version=nil)
        stream_version ||= 0

        entity = Example.get ID.example
        entity.some_attribute = Attribute.example stream_version
        entity.events_applied = stream_version + 1

        (0..stream_version).each do |stream_position|
          association_id = Association::ID.example stream_position
          association_attribute = Association::Attribute.example stream_position

          entity.example_association.find_or_new :id => association_id do |associated_entity|
            associated_entity.association_attribute = association_attribute
          end
        end

        entity
      end

      def self.insert(entity_id=nil, attribute: nil, stream_version: nil)
        attribute ||= Attribute.example
        entity_id ||= ID.example stream_version

        Example.create :id => entity_id, :some_attribute => attribute
      end
    end
  end
end
