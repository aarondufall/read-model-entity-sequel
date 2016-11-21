require_relative './automated_init'

context "Model Class Database Connection" do
  model_class = Controls::Entity::Example

  test "Connection is set" do
    assert model_class.db == ReadModel::Entity::Sequel::Connection.get
  end
end
