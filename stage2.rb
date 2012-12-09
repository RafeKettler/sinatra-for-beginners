require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  'Hello world!'
end

get '/:answer' do
  if params[:answer] == '42'
    "You've found the answer!"
  else
    'Wrong'
  end
end

post '/post' do
  "This was a post request"
end
