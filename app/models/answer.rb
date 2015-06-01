class Answer < ActiveRecord::Base
 belongs_to :question
 has_many :answer_takers
 has_many :takers, through: :answer_takers, source: :taker
end
