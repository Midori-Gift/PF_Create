$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
     $.ajax({
      type: 'GET',
      url: '/greats/search',
      data: { keyword: input },
      dataType: 'json'
  });
});


$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/greats/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(greats) {
      $(".contents.row").empty();
      if (greats.length !== 0) {
        greats.forEach(function(sample){
          appendGreat(great);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
  });
});