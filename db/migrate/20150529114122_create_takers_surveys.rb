class CreateTakersSurveys < ActiveRecord::Migration
  def change
    create_table :takers_surveys do |t|
      t.belongs_to :taker, null: false
      t.belongs_to :survey, null: false

      t.timestamps null: false
    end
  end
end
