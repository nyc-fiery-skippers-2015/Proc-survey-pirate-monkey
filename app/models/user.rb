class User < ActiveRecord::Base
  include BCrypt
  has_many :taker_surveys, foreign_key: 'taker_id'
  has_many :surveys, through: :taker_surveys

  has_many :created_surveys, foreign_key: 'creator_id', class_name: 'Survey'

  has_many :answer_takers, foreign_key: 'taker_id'
  has_many :answers, through: :answer_takers

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_pass)
    self.password == plaintext_pass
  end

end
