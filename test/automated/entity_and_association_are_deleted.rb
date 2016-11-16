require_relative './automated_init'

context "Both entity and associated entity representations are deleted from database" do
  entity_id = Identifier::UUID::Random.get
  association_id = Identifier::UUID::Random.get

  Controls::Entity.insert entity_id
  Controls::Entity::Association.insert association_id, entity_id: entity_id

  entity = Controls::Entity::Example.find_or_new :id =>  entity_id
  entity.delete = true
  entity.example_association.find_or_new :id => association_id do |associated_entity|
    associated_entity.delete = true
  end
  entity.save

  test "Database row corresponding to entity has been deleted" do
    entity = Controls::Entity::Example.find :id => entity_id

    assert entity == nil
  end

  test "Database row corresponding to associated entity has been updated" do
    associated_entity = Controls::Entity::Association::Example.find :id => association_id

    assert associated_entity == nil
  end
end
