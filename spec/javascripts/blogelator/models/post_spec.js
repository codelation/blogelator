(function() {
  "use strict";

  var store, post;

  module('App.Post', {
    setup: function() {
      store = dataStore();
      Ember.run(function() {
        post = store.find('post', 'post');
      });
    },
    teardown: function() {
      store = undefined;
      post  = undefined;
    }
  });

  // ---------------------------------------------------------
  // Attributes
  // ---------------------------------------------------------

  test('#bodyHtml', function() {
    equal(post.get('bodyHtml'), '<p>Hello world.</p>\n<h2>Ember Testing</h2>');
  });

  test('#bodyMarkdown', function() {
    equal(post.get('bodyMarkdown'), 'Hello world\n\n## Ember Testing');
  });

  test('#summary', function() {
    equal(post.get('summary'), 'Hello world.');
  });

  test('#title', function() {
    equal(post.get('title'), 'Ember Is Fun!');
  });

  test('#publishedAt', function() {
    deepEqual(post.get('publishedAt'), moment('January 12, 2014', 'MMMM D, YYYY'));
  });

  // ---------------------------------------------------------
  // Computed Properties
  // ---------------------------------------------------------

  test('#publishedAtFormatted should return the date published in the formate January 1, 2014', function() {
    equal(post.get('publishedAtFormatted'), 'January 12, 2014');
  });

  test('#publishedAtFormatted should return `Unpublished` if there is no published date', function() {
    Ember.run(function() {
      post.set('publishedAt', null);
      equal(post.get('publishedAtFormatted'), 'Unpublished');
    });
  });

  test('#updatedAtFormatted should how long ago the post was saved', function() {
    Ember.run(function() {
      post.set('updatedAt', moment().subtract('minutes', 2));
      equal(post.get('updatedAtFormatted'), '2 minutes ago');
    });
  });

})();
