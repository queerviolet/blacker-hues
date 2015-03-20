#!/usr/bin/env node

"use strict";

var dom = require('jsdom');
var fs = require('fs');

function phikalUrl(page) {
  var page = '000' + page;
  page = page.substr(page.length - 3, page.length);  
  return 'https://www.erowid.org/library/books_online/pihkal/pihkal' +
    page + '.shtml';
}

var pages = [];
for (let p = 1; p <= 179; ++p) {
  pages.push(new Promise(function(resolve, reject) {
    var url = phikalUrl(p);
    console.log('fetching', url);
    dom.env(url, function(error, window) {
      var document = window.document;
      var bolds = document.querySelectorAll('b');
      var bold = bolds[bolds.length - 1];
      var n = bold.nextSibling;
      var desc = '';
      while (n) {
        desc += n.textContent;
        n = n.nextSibling;
      }
      var title = document.querySelector('h2').textContent;
      var match = /#\d+ (.*)/.exec(title);
      if (match && match[1]) {
        title = match[1];
      }
      console.log(url, 'done');
      resolve({
        title: title,
        description: desc
          .replace(/\[.*\]/g, '')
          .replace(/^\s+/, '')
          .replace(/\s+$/g, ''),
      });
    });
  }));
}

Promise.all.call(Promise, pages)
  .then(function(done) {
    var out = 'PHIKAL = [';
    var i = done.length; while(--i >= 0) {
      out += '  {\n' +
             '    title: ' + JSON.stringify(done[i].title) + ', \n' +
             '    category: Category.find_by!(title: "Elixers"), \n' +
             '    description: ' + JSON.stringify(done[i].description) + ', \n' +
             '  },\n';
    }
    out += ']\n';
    var fname = __dirname + '/phikal.rb';
    var err = fs.writeFileSync(fname, out);
    if (err) {
      console.error(fname, err);
      return;
    }
    console.log('wrote', fname);
  });