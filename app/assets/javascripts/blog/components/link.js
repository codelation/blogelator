(function() {
  "use strict";

  var body, links;

  App.register('component').enter(function() {
    body = $('body');
    links = $('a[href]:not([href^="#"]):not([target="_blank"])');

    // Add 'loading' class to the body when a link is clicked,
    // add add 'active' class to the clicked link.
    links.click(function() {
      links.removeClass('active');
      body.addClass('loading');
      $(this).addClass('active');
    });
  }).exit(function() {
    // Remove the classes when the body is unloaded
    body.removeClass('loading');
    links.removeClass('active');
  });
})();
