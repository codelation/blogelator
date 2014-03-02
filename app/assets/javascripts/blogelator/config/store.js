(function() {
  "use strict";
  
  App.Store = DS.Store.extend({
    adapter: DS.RESTAdapter.extend({
      namespace: (App.get('blogelatorPath') === '/' ? '' : App.get('blogelatorPath').substring(1) + '/') + 'api'
    })
  });

})();
