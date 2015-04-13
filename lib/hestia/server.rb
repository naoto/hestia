require 'sinatra'

module Hestia
  class Server < Sinatra::Base

    configure do
      set :plugins, Plugins.new("#{File.dirname(__FILE__)}/../../plugins")
    end

    get %r{/(.+)$} do
      if !settings.plugins[params[:captures].first].nil?
        settings.plugins[params[:captures].first].scrap
      else
        # TODO ここにエラー処理入れる
      end
    end

  end
end
