require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test "should not save blog post without title" do
    blog_post = blog_posts(:two)
    assert_not blog_post.save
  end
end
