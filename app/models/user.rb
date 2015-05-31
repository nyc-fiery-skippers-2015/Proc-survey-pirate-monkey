class User < ActiveRecord::Base

has_many :taker_surveys, foreign_key: 'taker_id'
has_many :surveys, through: :taker_surveys

has_many :created_surveys, foreign_key: 'creator_id', class_name: 'Survey'

has_many :answer_takers, foreign_key: 'taker_id'
has_many :answers, through: :answer_takers
end
