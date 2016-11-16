module ReadModel::Entity::Sequel
  module Controls
    module Entity
      class Example < Sequel::Model(:example)
        plugin ReadModel::Entity::Sequel

        one_to_many(
          :example_association,
          :class => :Example,
          :class_namespace => "#{Entity}::Association",
          :key => :example_id
        )

        def event_applied
          self.events_applied ||= 0
          self.events_applied += 1
        end
      end
    end
  end
end
