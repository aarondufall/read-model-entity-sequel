require_relative './automated_init'

context "Entity representation is deleted from database" do
  entity_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id

  entity = Controls::Entity::Example.get entity_id
  entity.delete = true
  entity.save

  test "Database row corresponding to entity has been deleted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity == nil
  end
end
