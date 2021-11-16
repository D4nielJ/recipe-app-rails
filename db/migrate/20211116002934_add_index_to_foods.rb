class AddIndexToFoods < ActiveRecord::Migration[6.1]
  def change
    add_index :foods, %i[name user_id], unique: true
  end
end
