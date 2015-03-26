['rock', 'paper', 'scissors'].each do |t|
  Token.create!(name: t)
end

['Magneto', 'Xavier'].each do |u|
  User.create!(name: u)
end

