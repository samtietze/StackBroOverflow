
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
     console.log(response.value)
     console.log($(this))
     $voted_answer.siblings(".votable-value").text(response.value)
    });

      upVote.fail(function(response){
      alert("I'm sorry, this feature did not work. Please try again.")
    });
  });
});
=======

