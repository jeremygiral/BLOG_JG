class AddUsertoPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :user_id, :integer
    add_column :posts, :category_id, :integer
  end
end
