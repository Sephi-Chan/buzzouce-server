require 'pusher'
require 'sinatra'
require 'sinatra/cross_origin'


configure do
  enable :cross_origin
end


before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end


options '*' do
  response.headers['Allow'] = 'GET, POST, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
  response.headers['Access-Control-Allow-Origin'] = '*'
  200
end


post '/api/buzz' do
  pusher.trigger('buzzes', 'player-buzzed', name: data['name'])
  200
end


post '/api/reset' do
  pusher.trigger('buzzes', 'admin-reseted', name: data['name'])
  200
end


post '/api/reset_all' do
  pusher.trigger('buzzes', 'admin-reseted-all', {})
  200
end


post '/api/right' do
  pusher.trigger('buzzes', 'admin-accepted', name: data['name'])
  200
end


post '/api/wrong' do
  pusher.trigger('buzzes', 'admin-rejected', name: data['name'])
  200
end


def data
  @_data ||= JSON.parse(request.body.read)
end


def pusher
  Pusher::Client.new({
    app_id: 'OSEF',
    key: 'buzzouce',
    secret: 'endive',
    host: '0.0.0.0',
    port: 4567
  })
end
