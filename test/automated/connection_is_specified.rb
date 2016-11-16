require_relative './automated_init'

context "Connection is specified on a sequel model instance" do
  entity = Controls::Entity.example

  db = Object.new

  entity.db = db

  test "Database of instance is changed" do
    assert entity.db == db
  end

  test "Class level database is not changed" do
    refute entity.class.db == db
  end
end
