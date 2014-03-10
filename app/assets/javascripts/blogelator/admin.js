//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require moment
//= require_self
//= require_tree ./config
//= require_tree ./components
//= require_tree ./controllers
//= require_tree ./models
//= require_tree ./routes
//= require_tree ./templates

App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  blogelatorPath: '/' + (location.pathname.split('/')[1] === 'admin' ? '' : location.pathname.split('/')[1])
});