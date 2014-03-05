//= require blogelator/admin
//= require_self
//= require_tree ./fixtures
//= require_tree ./features

App.rootElement = '#qunit-fixture';
App.Store = DS.Store.extend({
  adapter: DS.FixtureAdapter
});

App.setupForTesting();
App.injectTestHelpers();