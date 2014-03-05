module('Admin Post', {
  setup: function() {
    App.reset();
  }
});

test('User visits the the page for a post.', function() {
  visit('/posts/1');
  andThen(function() {
    // List of posts
    equal(find('.posts-list .post.active').length, 1, 'The post should be selected in the side bar');
    
    // Main content area
    equal(find('article.post h1').text(), 'Ember Is Fun!', 'The selected post title should be displayed');
    equal(find('article.post .date').text(), 'January 12, 2014', 'The selected post date should be displayed');
    ok(find('article.post .body').html().indexOf('<p>Hello world.</p>' > 0), 'The selected post body should be displayed');
  });
});
