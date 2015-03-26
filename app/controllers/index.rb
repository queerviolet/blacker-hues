get '/' do
  game = Game.create!
  redirect "/games/#{game.id}"
end

get '/games/:game_id' do
  game = Game.find(params[:game_id])
  erb :game, locals: {game: game, tokens: Token.all}
end

# TODO: DRY this out
put '/games/:game_id/player_1_name' do
  game = Game.find(params[:game_id])
  game.player_1 = User.find_or_create_by!(name: params[:name])
  game.save!
  redirect back
end

put '/games/:game_id/player_2_name' do
  game = Game.find(params[:game_id])
  game.player_2 = User.find_or_create_by!(name: params[:name])
  game.save!
  redirect back
end

put '/games/:game_id/player_1_throw' do
  game = Game.find(params[:game_id])
  game.player_1_throw = Token.find(params[:id])
  game.save!
  redirect back
end

put '/games/:game_id/player_2_throw' do
  game = Game.find(params[:game_id])
  game.player_2_throw = Token.find(params[:id])
  game.save!
  redirect back
end

