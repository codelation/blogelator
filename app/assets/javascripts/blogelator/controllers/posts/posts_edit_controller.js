(function() {
  "use strict";
  
  App.PostsEditController = Ember.ObjectController.extend({
    needs: ['posts'],
    
    actions: {
      save: function() {
        var post = this.get('content'),
            controller = this.get('controllers.posts');
            
        post.save().then(function(post) {
          controller.transitionToRoute('posts.show', post);
        }, function(post) {
          console.log('POST ERRORS', post.get('errors'));
        });
        
        return post;
      }
    }
  });

})();
