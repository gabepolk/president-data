require 'sinatra'
require 'pry-byebug'

enable :sessions

set :bind, '0.0.0.0'

get '/' do
  erb :index
end