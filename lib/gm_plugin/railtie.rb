require 'rails'

module Ym4r
  module GmPlugin
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if ::Rails.root.join("config","gmaps_api_key.yml").exist?
          #Read the API key config for the current ENV
          env = ENV['RAILS_ENV'] || Rails.env
          ApiKey::GMAPS_API_KEY = YAML.load_file(::Rails.root.join("config","gmaps_api_key.yml"))[env]
        else
          raise GMapsAPIKeyConfigFileNotFoundException.new("File 'config/gmaps_api_key.yml' not found")
        end
      end
    end
  end
end

