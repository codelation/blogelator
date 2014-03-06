//= require blogelator/admin
//= require_self
//= require_tree ./fixtures
//= require_tree ./features

App.rootElement = '#ember-app';
App.setupForTesting();
App.injectTestHelpers();

App.Store = DS.Store.extend({
  adapter: DS.FixtureAdapter
});
