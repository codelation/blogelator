(function() {
  "use strict";
  
  App.PostsIndexController = Ember.ArrayController.extend({
    needs: ['posts'],
    contentBinding: 'controllers.posts.content'
  });

})();
