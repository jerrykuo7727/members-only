class AddTextToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :text, :text
  end
end
