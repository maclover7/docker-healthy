require 'sinatra/base'
require 'net_http_unix'
require 'json'

module Healthchecker
  class Application < Sinatra::Application
    get '/' do
      erb :index, locals: { services: containers }
    end

    get '/api' do
      json({
        services: containers
      })
    end

    get '/ping' do
      'ok'
    end

    private

    def containers
      #containers = `curl --unix-socket /var/run/docker.sock http:/v1.24/containers/json`

      req = Net::HTTP::Get.new("/v1.24/containers/json")
      client = NetX::HTTPUnix.new('unix:///var/run/docker.sock')
      containers = client.request(req).body
      containers = JSON.parse(containers)

      containers.map! do |container|
        {
          name: container['Image'],
          status: container['Status']
        }
      end
    end

    def json(data)
      content_type 'application/json'
      JSON.dump(data)
    end
  end
end
