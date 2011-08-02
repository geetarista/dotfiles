$(function() {
  // move form to header
  $('form:last')
    .css({ 'color': 'black', 'position': 'absolute', 'right': '400px' })
    .prependTo('body');
});

