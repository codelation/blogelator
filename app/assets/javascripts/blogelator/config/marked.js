//= require marked
//= require prettify

marked.setOptions({
  langPrefix: 'prettyprint lang-',
  highlight: function(code, lang) {
    return prettyPrintOne(code, lang);
  }
});