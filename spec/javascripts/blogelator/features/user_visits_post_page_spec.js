(function() {
  "use strict";

  module('User visits the the page for a post.');

  test('the post is selected', function() {
    visit('/posts/post');
    andThen(function() {
      equal(find('.posts-list .post.active').length, 1, 'The post element has the class `active`');
    });
  });

  test('the post is displayed in the content area', function() {
    visit('/posts/post');
    andThen(function() {
      equal(find('article.post h1').text().trim(), 'Ember Is Fun!', 'The selected post title should be displayed');
      equal(find('article.post .date').text().trim(), 'January 12, 2014', 'The selected post date should be displayed');
      ok(find('article.post .body').html().indexOf('<p>Hello world.</p>' > 0), 'The selected post body should be displayed');
    });
  });

})();
