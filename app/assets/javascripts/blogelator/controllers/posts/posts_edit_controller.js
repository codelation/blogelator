(function() {
  "use strict";
  
  App.PostsEditController = Ember.ObjectController.extend({
    needs: ['posts'],
    secondsPassed: 0,
    
    actions: {
      publish: function(defer) {
        var post = this.get('content');
        
        post.set('publishedAt', new Date());
        
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
      
      unpublish: function(defer) {
        var post = this.get('content');
        
        post.set('publishedAt', null);
        
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
    
    lastUpdatedAt: function() {
      var updatedAt = this.get('updatedAt');
      
      if (!Ember.isNone(updatedAt)) {
        return moment(updatedAt).fromNow();
      }
    }.property('secondsPassed', 'updatedAt'),
    
    updateSecondsPassed: function() {
      var self = this;
      this.incrementProperty('secondsPassed', 1);
      Ember.run.later(function() {
        self.updateSecondsPassed();
      }, 1000);
    }
  });

})();
