(function() {
  "use strict";
  
  App.AdminPostsIndexController = Ember.ArrayController.extend({
    needs: ['adminPosts'],
    contentBinding: 'controllers.adminPosts.content'
  });

})();
