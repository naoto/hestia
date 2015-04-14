require 'json'

module Hestia
  class Server < Sinatra::Base

    configure do
      set :plugins, Plugins.new("#{File.dirname(__FILE__)}/../../plugins")
    end

    get %r{/(.+)$} do
      content_type 'application/json'
      if settings.plugins.match?(params[:captures].first)
        settings.plugins.scrap(params[:captures].first).to_json
      else
        "{\"error\" => \"No Plugin Pattern\"}"
      end
    end

  end
end
