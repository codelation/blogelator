//= require marked
//= require prettify

marked.setOptions({
  langPrefix: 'prettyprint lang-',
  smartypants: true,
  highlight: function(code, lang) {
    return prettyPrintOne(code, lang);
  }
});