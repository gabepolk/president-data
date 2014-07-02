require 'sinatra'
require_relative 'lib/rps.rb'
require 'pry-byebug'

enable :sessions

set :bind, '0.0.0.0'

get '/' do
  
end