//= require jquery
//= require tether
//= require bootstrap
//= require jquery_ujs
//= require turbolinks

//= require ext/window
//= require_tree ./lib
//= require_tree ./helpers

//= require searches

namespace('Flickr.App');

$(function()
{
  Flickr.App.Flash = new Flickr.Lib.FlashMessage($('#flash-container'));
});
