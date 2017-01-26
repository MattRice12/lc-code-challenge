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


$(document).ready(function() {
  $(textarea).on('keyup', function() {
    countChar(this);
  });

  $(window).on('load', function() {
   countChar(textarea);
  });

  $("#toggle").on('click', function() {
    toggleOnClick()
  });

  $(window).on('resize', function() {
   toggleOnSize();
  }).resize();
});

var open = true;

function countChar(val) {
  var len = $(val).context.value.length
  var char = $('#charNum');

  $(char).text((500 - len) + " / 500");
  if (len > 500) {
    $(char).addClass("red-font")
  } else {
    $(char).removeClass("red-font")
  }
};

function showInstructions() {
  $(".fa").addClass("fa-chevron-down").removeClass("fa-chevron-right");
  $(".instructions").slideDown("fast");
};

function hideInstructions() {
  $(".fa").addClass("fa-chevron-right").removeClass("fa-chevron-down");
  $(".instructions").slideUp("fast");
};

function toggleOnClick() {
  open = !open;
  if (open === true) {
    showInstructions();
  } else {
    hideInstructions();
  }
};

function toggleOnSize() {
  if ($(window).width() > 975) {
    open = true;
    showInstructions();
  } else {
    open = false;
    hideInstructions()
  }
};
