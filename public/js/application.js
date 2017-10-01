
$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()5exs4zgv7fy

  $(".vote").on('submit', function(){
    event.preventDefault();
    var $voted_answer = $(this)
    var url = $voted_answer.attr("action")
    var method = $voted_answer.attr("method")
    var data = $voted_answer.serializeArray();

    console.log(data)

    var upVote = $.ajax({
      method: method,
      url: url,
      data: data,
      dataType: 'json'
    });

    upVote.done(function(response){
    console.log("this is the response:")
     console.log(response.value)
     console.log($(this))
     console.log($voted_answer.siblings('.votable-value'))
     $voted_answer.siblings(".votable-value").text(response.value)
    });

      upVote.fail(function(response){
      alert("I'm sorry, this feature did not work. Please try again.")
    });
  });

  $("#new-question").on("click", function(){
    event.preventDefault();
    var $link = $(this);
    var url = $link.attr("href");
    console.log("this works")

    var newQuestion = $.ajax({
      url: url
    });

    newQuestion.done(function(response){
      $link.hide();
      $(".main").prepend(response)

    });

  });

  $(".main").on("submit", "#question-form", function(){
      event.preventDefault();
      var $form = $(this);
      var url = $form.attr("action");
      var method = $form.attr("method");
      var data = $form.serialize();
      console.log("this works")


      var request = $.ajax({
        url: url,
        method: method,
        data: data
      });

      request.done(function(response){
        $form.remove();
        $("#new-question").show();
        $(".question-page-container ul").append(response);
        console.log(response)
      });

  });
// LINK TO CLICK ON
  $("#new-question-comment").on("click", function(){
     event.preventDefault();
      var $link = $(this);
      var url = $link.attr("href");
      console.log("this works");

      var questionComment = $.ajax({
        url: url
    });

// CONTAINER THAT THE NEW FORM WILL APPEAR ON
      questionComment.done(function(response){
        $link.remove();
        $(".question-comments-list-container").prepend(response)

    });
  });
// CLASS OF THE NEW COMMENT FORM. SUBMIT ON ID OF THE FORM OF THE NEW COMMENT FORM
    $(".new-comment").on("submit", "#question-comment-form", function(){
      event.preventDefault();
      var $form = $(this);
      var url = $form.attr("action");
      var method = $form.attr("method");
      var data = $form.serialize();
      console.log("this works")


      var request = $.ajax({
        url: url,
        method: method,
        data: data
      });
// APPEND TO THE APPROPIATE CONTAINER. USE LI or UI TO FIND THE LIST
      request.done(function(response){
        $form.remove();
        $("#new-question-comment").show();
        $(".question-comments-list-container li").append(response);
        console.log(response)
      });

  });


    $(".question-answer-list-container").on("click", ".answer-comments > a", function(){
        event.preventDefault();
        var $link = $(this);
        var url = $link.attr("href");
        console.log("this works");

        var answerComment = $.ajax({
          url: url
    });

        answerComment.done(function(response){
          $link.remove();
          $(".answer-container").prepend(response)
        });

  });

//     $(".answer-comment").on("submit", "#answer-comment-form", function(){
//       event.preventDefault();
//       var $form = $(this);
//       var url = $form.attr("action");
//       var method = $form.attr("method");
//       var data = $form.serialize();
//       console.log("this works")


//       var request = $.ajax({
//         url: url,
//         method: method,
//         data: data
//       });
// // APPEND TO THE APPROPIATE CONTAINER. USE LI or UI TO FIND THE LIST
//       request.done(function(response){
//         $form.remove();
//         $(".answer-comments > a").show();
//         $(".question-comments-list-container li").append(response);
//         console.log(response)
//       });

//   });




});

// ##VIDEO/FUN STUFF
$('a.introVid').click(function(){
  autoPlayVideo('VIDEO_ID_HERE','450','283');
});

function autoPlayVideo(vcode, width, height){
  "use strict";
  $("#videoContainer").html('<iframe width="'+width+'" height="'+height+'" src="https://www.youtube.com/embed/'+vcode+'?autoplay=1&loop=1&rel=0&wmode=transparent" frameborder="0" allowfullscreen wmode="Opaque"></iframe>');
}

