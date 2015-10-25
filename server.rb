require 'sinatra'
require 'pry'
require_relative 'black_jack'

game = BlackJack.new

get '/home' do
  if game.finished
    winner = game.winner
  else
    winner = nil
  end
  erb :index, locals: {
    player_hand: game.player_hand, dealer_hand: game.dealer_hand, winner: winner
  }
end

post '/home' do
  if params["game"] == "New Game"
    game = BlackJack.new
  else
    game.player_turn(params["game"])
  end
  redirect '/home'
end
