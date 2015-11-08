class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :particular_id
      t.string :answer

      t.timestamps null: false
    end
  end
end
