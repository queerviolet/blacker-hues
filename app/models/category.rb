class Category < ActiveRecord::Base
  has_many :things
end
