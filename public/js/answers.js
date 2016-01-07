$(function(){
  // when button click load form for comment and author
  $(show_answer_form());
    $(add_answer_data());
});

$(function(){
  $(show_edit_form());
    $(update_answer_data());
});

function show_edit_form(){
  $("#edit_answer_button").on("click", function(event){
      event.preventDefault();
      $("#edit_answer_button").hide()
      $("#edit_answer_form").show()
  });
};

function show_answer_form(){
  $("#new_answer_button").on("click", function(event){
    event.preventDefault();
    $("#new_answer_button").hide()
    $("#new_answer_form").show()
  });
};

function add_answer_data(){
  $("form data-new[new_answer_form]").submit(function(event){
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
      append_new_answer(parsed_data);
    })
  });
};

function update_answer_data(){
  $("form data-edit[answers edit]").submit(function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize();
    var answer = $(this).prev()
    var request = $.ajax({
      method: "PUT",
      url: url,
      data: data
      // missing toggle of comment box
    });
    request.done(function(body) {
      // var parsed_data = JSON.parse(body);
      // console.log(body)
      answer.html(body)
    })
  });
};

function append_new_answer(parsed_data){
  $(".answer_list").append("<li>" + parsed_data.answer + "</li>");
  $(".answer_list li:last-child").append("<span class=\"author\">" + parsed_data.author + "</span>");
};
