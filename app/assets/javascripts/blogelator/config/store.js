(function() {
  "use strict";
  
  App.Store = DS.Store.extend({
    adapter: DS.RESTAdapter.extend({
      namespace: App.blogelatorPath.substring(1) + '/api'
    })
  });

})();
