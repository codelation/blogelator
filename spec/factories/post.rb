FactoryGirl.define do
  factory :post, class: Blogelator::Post do
    title "My First Blog Post"
    body_markdown "## Heading.h2\n\nHere's a paragraph with some **bold** text.\n\n- And some\n- List\n- Items"
  end
  
  factory :long_post, class: Blogelator::Post do
    title "This Is a Long Post"
    body_markdown "This should be in the summary. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam magna turpis, ornare et scelerisque quis, dapibus at ligula. Fusce eros tellus, porttitor eu mi sed, consectetur lobortis ipsum. In sit amet est fringilla, facilisis elit id, tincidunt magna. In eleifend convallis mi, ut molestie turpis vulputate vitae. Fusce auctor adipiscing lectus, ultrices porta libero sollicitudin id. Mauris fermentum at eros ut semper. Pellentesque ac nisl dolor. Fusce quis augue quam. Nullam ultrices vitae magna nec feugiat. Duis imperdiet et quam mollis sollicitudin. Aliquam cursus quis libero ac feugiat. In sodales suscipit velit, a hendrerit diam scelerisque sed. Donec at tincidunt turpis. Nunc eu consequat velit. Praesent mollis ante sit amet enim vehicula adipiscing. Suspendisse pellentesque, risus eu venenatis tristique, erat turpis sodales lorem, ac sagittis diam nibh in tellus. This should not show up in the summary."
  end
end