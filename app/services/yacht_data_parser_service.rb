require 'yaml'

class YachtDataParserService
  YACHT_DATA_FILE_PATH = 'yacht_data.yml'

  def call
    yacht_data = YAML.load_file(YACHT_DATA_FILE_PATH)
    yacht_data['yachts'].to_json
  end
end