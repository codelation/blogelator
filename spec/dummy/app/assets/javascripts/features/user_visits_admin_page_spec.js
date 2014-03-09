test('User visits the admin page.', function() {
  visit('/');
  andThen(function() {
    // List of posts
    equal(find('.posts-list .post').length, 2, 'The index page should have 2 posts.');
    equal(find('.posts-list .post:first .date').text().trim(), 'January 12, 2014', 'The date should be displayed for each post');
    equal(find('.posts-list .post:first .summary').text().trim(), 'Hello world.', 'The summary should be displayed for each post');
    
    // Main content area
    equal(find('article.post h1').text().trim(), 'Ember Is Fun!', 'The first post title should be displayed');
  });
});
