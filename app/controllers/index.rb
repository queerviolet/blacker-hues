get '/' do
  game = Game.create!
  redirect "/game/#{game.id}"
end

get '/game/:id' do
  game = Game.find(params[:id])
  erb :game, locals: {game: game}
end