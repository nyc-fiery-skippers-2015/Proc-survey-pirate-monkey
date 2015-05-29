class CreateAnswersTakers < ActiveRecord::Migration
  def change
    create_table :answers_takers do |t|
      t.belongs_to :answer, null: false
      t.belongs_to :taker, null: false

      t.timestamps null: false
    end
  end
end
