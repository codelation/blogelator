(function() {
  "use strict";

  App.Store = DS.Store.extend({
    adapter: DS.RESTAdapter.extend({
      namespace: (App.get('appPath') === '/' ? '' : App.get('appPath').substring(1) + '/') + 'api'
    })
  });

})();
