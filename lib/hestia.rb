require "./lib/hestia/version"

module Hestia
  require 'sinatra'
  require 'rinne'

  require './lib/hestia/plugins'
  require './lib/hestia/option'
  require './lib/hestia/server'
end
