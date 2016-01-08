$(function(){
  // when button click load form for comment and author
  $(show_comment_form());
    $(add_comment_data());
});

$(function(){
  $(show_comment_edit_form());
    $(update_comment_data());
});

function show_comment_edit_form(){
  $("#edit_comment_button").on("click", function(event){
      event.preventDefault();
      $("#edit_comment_button").hide();
      $("#edit_comment_form").show();
  });
};

function show_comment_form(){
  $("#new_comment_button").on("click", function(event){
    event.preventDefault();
    $("#new_comment_button").hide();
    $("#new_comment_form").show();
  });
};

function add_comment_data(){
  $("#new_comment_form").submit(function(event){
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
      append_new_comment(parsed_data);
    })
  });
};

function update_comment_data(){
  $("#edit_comment_form").submit(function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize();
    var comment = $(this).prev()
    var request = $.ajax({
      method: "PUT",
      url: url,
      data: data
      // missing toggle of comment box
    });
    request.done(function(body) {
      // var parsed_data = JSON.parse(body);
      // console.log(body)
      comment.html(body)
    })
  });
};

function append_new_comment(parsed_data){
  $(".comment_list").append("<li>" + parsed_data.comment + "</li>");
  $(".comment_list li:last-child").append("<span class=\"author\">" + parsed_data.author + "</span>");
};
