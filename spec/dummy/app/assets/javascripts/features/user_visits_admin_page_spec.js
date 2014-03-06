test('User visits the admin page.', function() {
  visit('/');
  andThen(function() {
    // List of posts
    equal(find('.posts-list .post').length, 2, 'The index page should have 2 posts.');
    equal(find('.posts-list .post:first .date').text(), 'January 12, 2014', 'The date should be displayed for each post');
    equal(find('.posts-list .post:first .summary').text(), 'Hello world.', 'The summary should be displayed for each post');
    
    // Main content area
    ok(find('article.post .logo').length, 'The logo should be in the main content area.');
  });
});
