require 'test_helper'

module Blogelator
  class PostTest < ActiveSupport::TestCase
    it "orders by created at" do
      hello = Post.create!(title: "Hello, world!", body_html: "Hello, world!", body_markdown: "Hello, world!")
      world = Post.create!(title: "World hello!", body_html: "World hello!", body_markdown: "World hello!")

      expect(User.ordered_by_created_at).to eq([hello, world])
    end
  end
end
