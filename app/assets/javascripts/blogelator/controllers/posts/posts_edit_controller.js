(function() {
  "use strict";
  
  App.PostsEditController = Ember.ObjectController.extend({
    needs: ['posts'],
    secondsPassed: 0,
    
    actions: {
      destroy: function(defer) {
        var post = this.get('content'),
            controller = this.get('controllers.posts');
        
        if (Ember.isNone(defer)) {
          post.destroyRecord();
          return post;
        }
                
        post.destroyRecord().then(function() {
          defer.resolve();
          Ember.run.later(function() {
            controller.transitionToRoute('posts.index');
          }, 900);
        }, function() {
          defer.reject();
        });
        
        return post;
      },
      
      save: function(defer) {
        var post = this.get('content');
        
        if (Ember.isNone(defer)) {
          post.save();
          return post;
        }
        
        if (!post.get('isDirty')) {
          defer.resolve();
        } else {
          post.save().then(function() {
            defer.resolve();
          }, function() {
            defer.reject();
          });
        }
        
        return post;
      },
      
      togglePublished: function(defer) {
        var post = this.get('content');
        
        if (Ember.isNone(post.get('publishedAt'))) {
          post.set('publishedAt', new Date());
        } else {
          post.set('publishedAt', null);
        }
        
        if (Ember.isNone(defer)) {
          post.save();
          return post;
        }
        
        if (!post.get('isDirty')) {
          defer.resolve();
        } else {
          post.save().then(function() {
            defer.resolve();
          }, function() {
            defer.reject();
          });
        }
        
        return post;
      }
    },
    
    init: function() {
      this._super();
      this.updateSecondsPassed();
    },
    
    isClean: function() {
      return !this.get('isDirty');
    }.property('isDirty'),
    
    updateSecondsPassed: function() {
      var self = this;
      this.incrementProperty('secondsPassed', 1);
      Ember.run.later(function() {
        self.updateSecondsPassed();
      }, 1000);
    }
  });

})();
