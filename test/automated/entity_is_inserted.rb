require_relative './automated_init'

context "Entity representation is inserted into database" do
  entity_id = Identifier::UUID::Random.get

  entity = Controls::Entity::Example.get entity_id
  entity.some_attribute = Controls::Entity::Attribute.example
  entity.save

  test "Database row corresponding to entity has been inserted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity.some_attribute == Controls::Entity::Attribute.example
  end
end
