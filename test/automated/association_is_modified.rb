require_relative './automated_init'

context "Associated entity representation in database is updated" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id
  Controls::Entity::Association.insert association_id, entity_id: entity_id

  entity = Controls::Entity::Example.get entity_id
  entity.example_association.each do |associated_entity|
    associated_entity.association_attribute = 'other-associated-value'
  end
  entity.save

  test "Database row corresponding to associated entity has been updated" do
    associated_entity = Controls::Entity::Association::Example.find :id => association_id

    assert associated_entity.association_attribute == 'other-associated-value'
  end
end
