class AddQuestionToParticular < ActiveRecord::Migration
  def change
    add_column :particulars, :question, :text
  end
end
