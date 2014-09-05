require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'
require 'twilio-ruby'
require_relative 'twilio_worker'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

# Application routes

get '/login' do 
	haml :login, :layout => :'layouts/application'
end

get '/' do
  haml :index, :layout => :'layouts/application'
end

post '/texts' do 
	response['Access-Control-Allow-Origin'] = '*'
	data = JSON.parse(request.body.read)
	TwilioWorker.new.send(data["phone_number"], data["instructions"])

	{status: 200}
end 