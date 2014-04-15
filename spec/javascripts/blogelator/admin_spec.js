//= require blogelator/admin
//= require blogelator/ember-qunit
//= require_tree ../support
//= require_self
//= require_tree ./fixtures
//= require_tree .

// Set up app for testing
App.setupForTesting();
App.injectTestHelpers();
App.Store = DS.Store.extend({
  adapter: DS.FixtureAdapter
});

// Include additional Ember test helpers
emq.globalize();
setResolver(Ember.DefaultResolver.create({ namespace: App }));
