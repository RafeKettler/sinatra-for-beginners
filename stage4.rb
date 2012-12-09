require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/:name' do
  @name = params[:name]
  erb :index
end     
