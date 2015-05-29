class Answer < ActiveRecord::Base
 belongs_to :question
 has_many :answers_takers
 has_many :takers, through: :answers_takers, source: :user


end
