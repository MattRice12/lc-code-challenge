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


$(document).on('turbolinks:load', function() {
  function countChar(val) {
    var len = $(val).context.value.length
    var char = $('#charNum');
    $(char).text((500 - len));
    if (len > 500) {
      $(char).addClass("red-font");
      $(char).attr("role", "alert")
    } else {
      $(char).removeClass("red-font");
      $(char).removeAttr("role", "alert")
    }
  };

  function toggleOnClick() {
    $(".fa").toggleClass("fa-chevron-down").toggleClass("fa-chevron-right");
    $(".instructions").slideToggle("fast");
  };

  function toggleOnSize() {
    if ($(window).width() > 768) {
      $("#toggle").hide();
      $(".fa").addClass("fa-chevron-down").removeClass("fa-chevron-right");
      $(".instructions").slideDown("fast");
    } else {
      $("#toggle").show();
      $(".fa").addClass("fa-chevron-right").removeClass("fa-chevron-down");
      $(".instructions").slideUp("fast");
    }
  };

  function replaceErrorsClass() {
    $('.errors').replaceWith('<div class="errors" tabindex="-1" role="alert"></div>')
  }

  function showSuccess(data) {
    replaceErrorsClass();
    $('.errors').append('<ul class="success"><li>Post successful!</li></ul>')
    if ($('#no-vents').length > 0) {
      $('#no-vents').remove()
      $('#vent-block').append('<ul class="vent-index" id="vent-index"></ul>');
    }
    $('#vent-index').prepend('<li class="vent"><p>' + data.text + '</p><sub>' + t.time.submitted.one + '</sub></li>');
    $("textarea").val("");
  };

  function showError(data) {
    replaceErrorsClass();
    $('.errors').append('<ul class="error" aria-label="Errors"></ul>')
    data.responseJSON.text.forEach(function(error) {
      $('.errors ul').append('<li>Vent ' + error + '</li>')
    });
  }

  $(textarea).on('keyup', function() {
    countChar(this);
  });

  $(window).on('turbolinks:load', function() {
   countChar(textarea);
   toggleOnSize();
  });

  $("#toggle").on('click', function() {
    toggleOnClick()
  });

  $(window).on('resize', function() {
   toggleOnSize();
  });

  $("form").on("ajax:success",function(e, data, status, xhr){
    showSuccess(data)
  }).on("ajax:error",function(e, data, status, xhr){
    showError(data)
  });
});
