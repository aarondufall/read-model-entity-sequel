require 'log'
require 'postgresql/connector'
require 'sequel'

module ReadModel
  Entity = Module.new
end

require 'read_model/entity/sequel/connection'
require 'read_model/entity/sequel/connection/adjusted_logger'
require 'read_model/entity/sequel/connection/settings'
require 'read_model/entity/sequel/sequel'

Sequel.database_timezone = :utc
