class Thing < ActiveRecord::Base
  belongs_to :category

  before_save :generate_token

  def generate_token
    unless edit_token
      charset = ('a'..'z').to_a + ('0'..'9').to_a
      key = Array.new(64) { charset.sample }
      self.edit_token = key.join('')
    end
  end
end
