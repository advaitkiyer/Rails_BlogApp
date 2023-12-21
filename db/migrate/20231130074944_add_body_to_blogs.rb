class AddBodyToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :body, :text
  end
end
