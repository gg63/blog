class RemoveCreateComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :user_id, :post_id, :integer
  end
end
