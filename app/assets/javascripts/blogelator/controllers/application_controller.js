(function() {
  "use strict";
  
  App.ApplicationController = Ember.ObjectController.extend({
    currentPathDidChange: function() {
      var bodyClass = 'ember-application blogelator admin ' + this.get('currentPath').split('.').join(' ');
      $('body').attr('class', bodyClass);
    }.observes('currentPath')
  });

})();
