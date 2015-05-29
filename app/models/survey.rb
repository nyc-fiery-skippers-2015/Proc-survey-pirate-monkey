class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :taker_surveys
  has_many :takers, through: :taker_surveys, source: :taker
end
