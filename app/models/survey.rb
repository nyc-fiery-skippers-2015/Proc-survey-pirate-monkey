class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :creator, class_name: 'User'
  has_many :takers_surveys
  has_many :users, through: :takers_surveys
end
