require_relative './automated_init'

context "Entity representation in database is updated" do
  entity_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id

  entity = Controls::Entity::Example.get entity_id
  entity.some_attribute = 'other-value'
  entity.save

  test "Database row corresponding to entity has been updated" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity.some_attribute == 'other-value'
  end
end
