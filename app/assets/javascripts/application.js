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
//= require_tree .


function countChar(val) {
  var len = val.value.length;
  $('#charNum').text((500 - len) + " / 500");
  if (len > 500) {
    $('#charNum').css("color", "red")
  } else {
    $('#charNum').css("color", "black")
  }
};

var open = true;
function toggleInstructions() {
  $(".instructions").slideToggle("fast");
  if (open === true) {
    $(".fa").addClass("fa-chevron-down").removeClass("fa-chevron-right");
  } else {
    $(".fa").addClass("fa-chevron-right").removeClass("fa-chevron-down");
  }
  open = !open;
};
