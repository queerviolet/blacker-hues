class User < ActiveRecord::Base
end

class Token < ActiveRecord::Base
  BEATS = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper',
  }

  def beats(victim)
    BEATS[name] == victim.name
  end
end

class Game < ActiveRecord::Base
  belongs_to :player_1, class_name: User
  belongs_to :player_2, class_name: User
  belongs_to :player_1_throw, class_name: Token
  belongs_to :player_2_throw, class_name: Token

  # return a User if there's a winner, otherwise nil.
  def winner
    return nil unless player_1_throw and player_2_throw
    return player_1 if player_1_throw.beats(player_2_throw)
    return player_2 if player_2_throw.beats(player_1_throw)
    nil
  end

  def complete?
    player_1_throw and player_2_throw
  end
end
