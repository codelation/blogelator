(function() {
  "use strict";
  
  App.ApplicationSerializer = DS.RESTSerializer.extend({
    keyForAttribute: function(attr) {
      return Ember.String.underscore(attr);
    }
  });

})();
