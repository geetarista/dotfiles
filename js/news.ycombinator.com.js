$(function() {
  // move form to header
  $('center center').find('form')
    .css({ 'color': 'black', 'position': 'absolute', 'right': '400px' })
    .prependTo('body');

  // I still like to see dead links/comments
  $("span.dead").css("color", "red");

  // my stuff is more prominent
  $("font[color='#ff6600']").parent().parent().next().find("a").css("color", "#ff6600")
});
