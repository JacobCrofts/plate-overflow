$(document).ready(function() {
  $("#new_comment_button").on("click", function(event){
      event.preventDefault();
      $("#new_comment_button").hide();
      $("#new_comment_form").show();

      $("form").submit(function(event){
        event.preventDefault();
        var url = $(this).attr("action");
        var data = $(this).serialize();
        var request = $.ajax({
          method: "POST",
          url: url,
          data: data
          // missing toggle of comment box
        });
        request.done(function(body) {
          var parsed_data = JSON.parse(body);
          $(".comment_list").append("<li>" + parsed_data.answer  + "<span class=\"author\">" + parsed_data.author + "</span>" + "</li>");
  });