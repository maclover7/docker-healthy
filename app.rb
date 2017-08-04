require 'sinatra/base'
require 'json'

module Healthchecker
  class Application < Sinatra::Application
    get '/api' do
      json({
        services: [
          macluster: "Up 23 seconds (healthy)"
        ]
      })
    end

    get '/ping' do
      'ok'
    end

    private

    def json(data)
      content_type 'application/json'
      JSON.dump(data)
    end
  end
end
