require 'sinatra'
require 'sshkey'
require 'bcrypt'
require './classes/classes.rb'

get '/' do
    'This is a simple asymmetrical encrypted app. This app is used only to generate the key pairs and store encrypted messages.'
end

get '/signup' do
    content_type :json
    req = request.body
    data = JSON.parse req.read
    username = data.username
    password = BCrypt::Password.create(data.password)
    # username = 'test'
    # password = BCrypt::Password.create('foo')
    key = SSHKey.generate
    user = User.new(username, password, key.public_key)
    return {
        user_info: user.show_user,
        private_key: key.private_key,
        message: "Note: please save your private key separately."
}.to_json
end