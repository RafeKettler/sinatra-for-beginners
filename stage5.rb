require 'sinatra'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)

# An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')

class PageView 
  include DataMapper::Resource
  
  property :id, Serial
  property :created_at, DateTime, :default => lambda { |res, prop| Time.now }
end

DataMapper.finalize
DataMapper.auto_migrate!

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  # Create a new instance of PageView and save it in the database
  pv = PageView.new
  pv.save
  @count = PageView.count
  erb :count
end
