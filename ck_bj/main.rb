require 'rubygems'
require 'sinatra'
require 'pry'

set :sessions, true

helpers do
  def calculate_total(cards)
    55
  end
end

get '/' do
  "Hello World!!!"
end

get '/test' do
  @error = "something is wrong"
  erb :test #, layout: false
  # redirect '/'
end

post '/set_name' do
  binding pry
  session[:player_name] = params[:player_name] # save to cookie 
  redirect '/game'
end

get 'game' do
  session[:deck] = [['2', 'H'], ['3', 'D']]
  session[:player_cards] = []
  session[:player_cards] << session[:deck].pop

  erb :game
end