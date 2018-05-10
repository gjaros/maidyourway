class AddBlogPicToBlogPost < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :blog_pic, :string
  end
end
