# encoding: utf-8

require "spec_helper"

feature "User visits a blog post" do
  
  it "has the title" do
    post = create(:post, published_at: Time.now)
    
    visit blogelator.post_path(post)
    
    page.should have_content "My First Blog Post"
  end
  
  it "has the body text" do
    post = create(:post, published_at: Time.now)
    
    visit blogelator.post_path(post)
    
    page.should have_content "paragraph with some bold text."
  end
  
  it "has a link to the next and previous post" do
    random_post = create(:post, title: "Random Post", published_at: Time.now - 12.days)
    random_post = create(:post, title: "Random Post", published_at: Time.now + 2.days)
    previous_post = create(:post, title: "Previous Post", published_at: Time.now - 10.days)
    post = create(:post, published_at: Time.now, published_at: Time.now - 5.days)
    next_post = create(:post, title: "Next Post", published_at: Time.now, published_at: Time.now)
    
    visit blogelator.post_path(post)
    
    page.should have_content previous_post.title
    page.should have_content next_post.title
    
    click_link("Previous Post")
    current_path.should eq(blogelator.post_path(previous_post))
    
    visit blogelator.post_path(post)
    
    click_link("Next Post")
    current_path.should eq(blogelator.post_path(next_post))
  end
  
end