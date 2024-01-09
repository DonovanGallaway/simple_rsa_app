require 'sinatra'
require './classes/classes.rb'

get '/' do
    'This is a simple asymmetrical encrypted app. This app is used only to generate the key pairs and store encrypted messages.'
end

post '/signup' do
    req = request.body
    data = JSON.parse req.read
    username = data.username
    password = BCrypt::Password.create(data.password)
    user = User.new({})
end