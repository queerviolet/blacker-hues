get '/' do
  game = Game.create!
  redirect "/games/#{game.id}"
end

get '/games/:id' do
  game = Game.find(params[:id])
  erb :game, locals: {game: game, tokens: Token.all}
end

# TODO: DRY this out
put '/games/:id/player_1_name' do
  game = Game.find(params[:id])
  game.player_1 = User.find_or_create_by!(name: params[:player_1_name])
  game.save!
  redirect back
end

put '/games/:id/player_2_name' do
  game = Game.find(params[:id])
  game.player_2 = User.find_or_create_by!(name: params[:player_2_name])
  game.save!
  redirect back
end

put '/games/:id/player_1_throw_id' do
  game = Game.find(params[:id])
  game.player_1_throw = Token.find(params[:player_1_throw_id])
  game.save!
  redirect back
end

put '/games/:id/player_2_throw_id' do
  game = Game.find(params[:id])
  game.player_2_throw = Token.find(params[:player_2_throw_id])
  game.save!
  redirect back
end

