# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'read_model-entity-sequel'
  s.version = '0.0.0.2'
  s.summary = 'Read Model Entity Sequel'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'developers@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/read-model-entity-sequel'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'
  s.bindir = 'bin'

  s.add_runtime_dependency 'identifier-uuid'
  s.add_runtime_dependency 'postgresql-connector'
  s.add_runtime_dependency 'sequel'
end
