require 'identifier/uuid'
require 'identifier/uuid/controls'

ReadModel::Entity::Sequel::Connection.connect

require 'read_model/entity/sequel/controls/id'

require 'read_model/entity/sequel/controls/entity'
require 'read_model/entity/sequel/controls/entity/association'
require 'read_model/entity/sequel/controls/entity/attribute'
require 'read_model/entity/sequel/controls/entity/example'
require 'read_model/entity/sequel/controls/entity/id'
require 'read_model/entity/sequel/controls/setup_schema'
require 'read_model/entity/sequel/controls/table_name'
