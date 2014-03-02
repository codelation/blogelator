FactoryGirl.define do
  factory :post, class: Blogelator::Post do
    title "My First Blog Post"
    body_markdown "## Heading.h2\n\nHere's a paragraph with some **bold** text.\n\n- And some\n- List\n- Items"
  end
end