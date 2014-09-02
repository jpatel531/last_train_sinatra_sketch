require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'
require 'twilio-ruby'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

# Application routes
get '/' do
  haml :index, :layout => :'layouts/application'
end

post '/texts' do 
	response['Access-Control-Allow-Origin'] = '*'
	data = JSON.parse(request.body.read)
	sms_sender = Twilio::REST::Client.new("AC2ee3aaedbbcefa36241064e99199d80d", "417e9ad3fe91f49d24ebbedafee0562a")
	sms_sender.account.messages.create(
		from: 441295477003, 
		to: data["phone_number"],
		body: data["instructions"]
		)
	{status: 200}.to_json
end 