<script>
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
        greats.forEach(function(great){
          appendGreat(great);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
  })
})
</script>