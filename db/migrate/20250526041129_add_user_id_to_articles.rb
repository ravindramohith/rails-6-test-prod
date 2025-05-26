class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer
    add_foreign_key :articles, :users
    add_index :articles, :user_id
  end
end
