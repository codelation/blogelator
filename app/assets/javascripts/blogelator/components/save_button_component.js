(function() {
  "use strict";

  App.SaveButtonComponent = Ember.Component.extend({
    attributeBindings: ['href'],
    classNames: ['save-button'],
    classNameBindings: ['isSaving:saving', 'isSaved:saved', 'isError:error'],
    href: '#',
    isSaving: false,
    isSaved: false,
    isError: false,
    tagName: 'a',
    
    click: function() {
      if (this.get('isSaving')) {
        return false;
      }
      
      var defer = Ember.RSVP.defer(),
          self = this;

      defer.promise.then(function() {
        if (self && !self.isDestroyed) {
          self.set('isSaved', true);
          self.set('isSaving', false);
        }
        Ember.run.later(function() {
          if (self && !self.isDestroyed) {
            self.set('isSaved', false);
          }
        }, 800);
      }, function() {
        if (self && !self.isDestroyed) {
          self.set('isError', true);
          self.set('isSaving', false);
        }
        Ember.run.later(function() {
          if (self && !self.isDestroyed) {
            self.set('isError', false);
          }
        }, 800);
      });
      
      this.set('isSaving', true);
      this.sendAction('action', defer);
      
      return false;
    }
  });
  
})();
