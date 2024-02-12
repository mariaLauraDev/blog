require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save blog post without title" do
    blog_post = BlogPost.new
    assert_not blog_post.save, "Saved the blog post without a title"
  end

  test "should not save blog post without body" do
    blog_post = BlogPost.new
    assert_not blog_post.save, "Saved the blog post without a body"
  end

  test "should save blog post with title and body" do
    blog_post = BlogPost.new(title: "Hello, World!", body: "This is my first blog post. I'm so excited to share my thoughts with the world!")
    assert blog_post.save, "Did not save the blog post with a title and body"
  end

end
