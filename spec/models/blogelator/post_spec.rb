require "spec_helper"

module Blogelator
  
  describe Post, ".published" do
    it "returns only published posts" do
      published_post = create(:post, published_at: Time.now)
      unpublished_post = create(:post)
      Post.published.should eq([published_post])
    end
  end
  
  describe Post, ".unpublished" do
    it "returns only unpublished posts" do
      published_post = create(:post, published_at: Time.now)
      unpublished_post = create(:post)
      Post.unpublished.should eq([unpublished_post])
    end
  end
  
  describe Post, "#published?" do
    it "returns whether the post is published" do
      published_post = create(:post, published_at: Time.now)
      unpublished_post = create(:post)
      published_post.published?.should eq(true)
      unpublished_post.published?.should eq(false)
    end
  end
  
  describe Post, "#slug" do
    it "returns the title as a parameterized URL on published posts" do
      published_post = create(:post, published_at: Time.now)
      published_post.slug.should eq("my-first-blog-post")
    end
    
    it "returns nil on unpublished posts" do
      unpublished_post = create(:post)
      unpublished_post.slug.should eq(nil)
    end
    
    it "should not change the on additional saves if the post is published" do
      published_post = create(:post, published_at: Time.now)
      published_post.title = "Title Changed"
      published_post.save
      published_post.slug.should eq("my-first-blog-post")
    end
    
    it "should use the last title until published" do
      post = create(:post)
      post.slug.should eq(nil)
      post.title = "Title Changed"
      post.published_at = Time.now
      post.save
      post.slug.should eq("title-changed")
    end
  end
  
  describe Post, "#body_html" do
    it "returns the converted HTML from #body_markdown on save" do
      post = create(:post)
      post.body_html.should eq("<h2>Heading.h2</h2>\n\n<p>Here&rsquo;s a paragraph with some <strong>bold</strong> text.</p>\n\n<ul>\n<li>And some</li>\n<li>List</li>\n<li>Items</li>\n</ul>\n")
    end
  end
  
end
