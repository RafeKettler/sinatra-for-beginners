require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/static'

enable :sessions

get '/:memory' do
  if session[:memory]
    "I remembered #{session[:memory]}. I might forget if you clear your cookies."
  else
    session[:memory] = params[:memory]
    "I'm remembering #{params[:memory]} for you..."
  end
end
