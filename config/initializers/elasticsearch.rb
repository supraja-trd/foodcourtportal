# require 'elasticsearch/transport'

# config = {
#     host: "http://localhost:9200/"
#   }
  
# if File.exists?("config/elasticsearch.yml")
#     config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].deep_symbolize_keys)
# end
  
# Elasticsearch::Model.client = Elasticsearch::Client.new(config)

Elasticsearch::Model.client = Elasticsearch::Client.new host: "localhost:9200"