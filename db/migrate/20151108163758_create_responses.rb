class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :person, :null => false
      t.references :choice, :null => false
      t.timestamps null: false
    end
  end
end
