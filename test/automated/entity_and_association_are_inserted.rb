require_relative './automated_init'

context "Both entity and associated entity representations are inserted into database" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  entity = Controls::Entity::Example.find_or_new :id => entity_id
  entity.some_attribute = 'some-value'
  entity.example_association.find_or_new :id => association_id do |association_entity|
    association_entity.association_attribute = 'some-associated-value'
  end
  entity.save

  test "Database row corresponding to entity has been inserted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity.some_attribute == 'some-value'
  end

  test "Database row corresponding to associated entity has been inserted" do
    association_entity = Controls::Entity::Association::Example.find :id => association_id

    assert association_entity.association_attribute == 'some-associated-value'
  end
end
