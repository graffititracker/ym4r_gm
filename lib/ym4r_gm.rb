require 'gm_plugin/key'
require 'gm_plugin/mapping'
require 'gm_plugin/map'
require 'gm_plugin/control'
require 'gm_plugin/point'
require 'gm_plugin/overlay'
require 'gm_plugin/layer'
require 'gm_plugin/helper'
require 'gm_plugin/geocoding'
require 'gm_plugin/encoder'
require 'gm_plugin/railtie' if defined?(Rails::Railtie)

include Ym4r::GmPlugin
