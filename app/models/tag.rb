class Tag < ActiveRecord::Base
  has_many :tag_things
  has_many :things, through: :tag_things
end
