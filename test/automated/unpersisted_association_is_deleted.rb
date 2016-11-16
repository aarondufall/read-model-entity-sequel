require_relative './automated_init'

context "Associated entity representation not currently in database is deleted" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id

  entity = Controls::Entity::Example.get entity_id
  entity.example_association.find_or_new :id => association_id do |associated_entity|
    associated_entity.delete = true
  end
  entity.save

  test "Database row corresponding to associated entity has not been inserted" do
    entity = Controls::Entity::Association::Example.find :id => association_id

    assert entity == nil
  end
end
