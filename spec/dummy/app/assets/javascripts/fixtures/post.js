App.Post.FIXTURES = [
  { 
    id: 1, 
    bodyHtml: '<p>Hello world.</p>\n<h2>Ember Testing</h2>', 
    bodyMarkdown: 'Hello world\n\n## Ember Testing',
    summary: 'Hello world.',
    title: 'Ember Is Fun!',
    publishedAt: moment('January 12, 2014', 'MMMM D, YYYY')
  },
  { 
    id: 2, 
    bodyHtml: '<p>Hello again.</p>\n<h3>Something Else</h3>', 
    bodyMarkdown: 'Hello again\n\n### Something Else',
    summary: 'Hello again.',
    title: 'I <3 GitHub Flavored Markdown'
  }
];
