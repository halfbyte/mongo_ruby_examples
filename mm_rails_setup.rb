# config/initializers/mongo_mapper.rb
mongo_config = YAML.load_file(
  File.join(Rails.root, 'config','mongomapper.yml')
)
MongoMapper.setup(mongo_config, Rails.env)
