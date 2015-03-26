class User < ActiveRecord::Base
end

class Piece < ActiveRecord::Base
  BEATS = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper',
  }

  def beats(other)
    BEATS[self.name] == other.name
  end
end

class Game < ActiveRecord::Base
  belongs_to :player_1, foreign_key: 'player_1_id', class_name: 'User'
  belongs_to :player_2, foreign_key: 'player_2_id', class_name: 'User'
  belongs_to :throw_1, foreign_key: 'throw_1_id', class_name: 'Piece'
  belongs_to :throw_2, foreign_key: 'throw_2_id', class_name: 'Piece'

  def complete?
    return false unless throw_1 and throw_2
    true
  end

  def winner
    return nil unless complete?
    return player_1 if throw_1.beats(throw_2)
    return player_2 if throw_2.beats(throw_1)
    nil
  end
end

