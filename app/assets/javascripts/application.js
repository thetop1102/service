// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .
//= require script
//= require jquery.fitvids
//= require modernizr.min
//= require jquery.min

$('span.menu').click(function() {
  $('ul.res').slideToggle( 300, function() {
  });
});

$(document).ready(function() {
  $('#owl-demo').owlCarousel({
    items : 3,
    lazyLoad : true,
    autoPlay : false,
    pagination : true,
  });
});

  $(".notifications .messages").hide();
  $(".notifications").click(function() {
    if ($(this).children(".messages").children().length > 0) {
      $(this).children(".messages").fadeToggle(300);
    }
  });

$(".reply").click(function(){
  var a = $(this).closest(".sub-comment").find(".reply-comment-form").toggle();
});
