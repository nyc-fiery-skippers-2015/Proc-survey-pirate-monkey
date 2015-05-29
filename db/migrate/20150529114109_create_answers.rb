class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.belongs_to :question, null: false

      t.timestamps null: false
    end
  end
end
