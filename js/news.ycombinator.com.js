$(function() {
  // move form to header
  $('span.yclinks').parent().find('form')
    .css({ 'color': 'black', 'position': 'absolute', 'right': '400px' })
    .prependTo('body');
});

