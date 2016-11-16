module ReadModel::Entity::Sequel
  module Controls
    module Entity
      module Association
        def self.insert(associated_entity_id=nil, entity_id: nil, attribute: nil, stream_version: nil)
          associated_entity_id ||= ID.example stream_version
          attribute ||= Attribute.example
          entity_id ||= Entity::ID.example stream_version

          Example.create(
            :id => associated_entity_id,
            :example_id => entity_id,
            :association_attribute => attribute
          )
        end

        class Example < Sequel::Model(:example_association)
          plugin ReadModel::Entity::Sequel
        end

        module Attribute
          def self.example(stream_version=nil)
            stream_version ||= 0

            "some-associated-value-#{stream_version}"
          end
        end

        module ID
          def self.example(stream_version=nil)
            stream_version ||= 0

            stream_version = stream_version % 3

            i = 10 + stream_version

            Controls::ID.example i
          end
        end
      end
    end
  end
end
