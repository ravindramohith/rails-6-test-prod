class CreateArticlesCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_categories do |t|
      t.integer :category_id
      t.integer :article_id
      t.timestamps
    end
  end
end
