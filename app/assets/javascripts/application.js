// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require lightbox
//= require_tree .

$(function() {
  var s = 0;
  $('.menu-toggle').click(function() {
    if (s == 0) {
      s = 1;
      $( "#sidebar" ).animate({left: "-210px"}, 100 );
      $('.dashboard-wrapper').animate({'margin-left': "0px"}, 100);
    } else {
      s = 0;
      $('#sidebar').animate({left: "0px"}, 100);
      $('.dashboard-wrapper').animate({'margin-left': "210px"}, 100);
    }
  });
});