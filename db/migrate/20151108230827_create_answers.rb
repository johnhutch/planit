class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :other
      t.integer :choice_id
      t.integer :response_id

      t.timestamps null: false
    end
  end
end
