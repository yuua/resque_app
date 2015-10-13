require 'yaml'

module Init
  class << self
    def data_yaml_parser
      YAML::load(File.open(File.join(File.expand_path('../../../config/',__FILE__),'data.yml'))).each do |k,v|
        return v
      end
    end

  end

end
