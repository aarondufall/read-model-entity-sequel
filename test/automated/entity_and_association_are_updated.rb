require_relative './automated_init'

context "Both entity and associated entity representations in database are updated" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id
  Controls::Entity::Association.insert association_id, entity_id: entity_id

  entity = Controls::Entity::Example.find_or_new :id =>  entity_id
  entity.some_attribute = 'other-value'
  entity.example_association.find_or_new :id => association_id do |association_entity|
    association_entity.association_attribute = 'other-associated-value'
  end
  entity.save

  test "Database row corresponding to entity has been updated" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity.some_attribute == 'other-value'
  end

  test "Database row corresponding to associated entity has been updated" do
    association_entity = Controls::Entity::Association::Example.find :id => association_id

    assert association_entity.association_attribute == 'other-associated-value'
  end
end
