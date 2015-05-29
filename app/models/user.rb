class User < ActiveRecord::Base
  has_many :surveys, foreign_key: 'creator_id'
  has_many :answers_takers
  has_many :answers, through: :answers_takers
  has_many :takers_surveys
  has_many :surveys, through: :takers_surveys
end
