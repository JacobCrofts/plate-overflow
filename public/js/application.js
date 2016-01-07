$(function(){
  // when button click load form for comment and author
  $("#new_answer_button").on("click", function(event){
    event.preventDefault();
    $("#new_answer_button").hide()
    $("#new_answer_form").show()

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
        $(".answer_list").append("<li>" + parsed_data.answer + "</li>");
          $(".answer_list li:last-child").append("<span class=\"author\">" + parsed_data.author + "</span>");
      })
    });
  });
});
