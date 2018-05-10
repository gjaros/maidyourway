class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.integer :user_id
      t.string :title
      t.text :blog

      t.timestamps
    end
  end
end
