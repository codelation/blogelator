(function() {
  "use strict";
  
  App.Router.reopen({
    rootURL: (App.get('blogelatorPath') === '/' ? '' : App.get('blogelatorPath')) + '/admin',
    location: 'history'
  });

})();
