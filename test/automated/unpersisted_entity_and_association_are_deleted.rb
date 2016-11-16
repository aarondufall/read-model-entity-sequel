require_relative './automated_init'

context "Entity and associated entity representation not currently in database are deleted" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  entity = Controls::Entity::Example.get entity_id
  entity.example_association.find_or_new :id => association_id do |associated_entity|
    associated_entity.delete = true
  end
  entity.delete = true
  entity.save

  test "Database row corresponding to entity has not been inserted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity == nil
  end

  test "Database row corresponding to associated entity has not been inserted" do
    entity = Controls::Entity::Association::Example.find :id => association_id

    assert entity == nil
  end
end
