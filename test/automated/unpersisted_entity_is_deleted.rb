require_relative './automated_init'

context "Entity representation not currently in database is deleted" do
  entity_id = Identifier::UUID::Random.get

  entity = Controls::Entity::Example.get entity_id
  entity.delete = true
  entity.save

  test "Database row corresponding to entity has not been inserted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity == nil
  end
end
