<script>
$(function() {
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',              //HTTPメソッドはGET
      url: '/great/search',    //rails routesで確認
      data: { keyword: input },
      dataType: 'json'
    })
  });
});
//キーを離したら処理をさせたいときはkeyupメソッドを使用

.done(function(greats) {
      search_list.empty();
      if (greats.length !== 0) {        //tweetsの数が0でない時、
        greats.forEach(function(great){ //forEachメソッド
          appendGreat(great);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {    //error時のaleart実装
      alert('error');
    });
  });
});


var search_list = $(".contents.row");

  function appendTweet(tweet) {
    if(great.user_sign_in && great.user_sign_in.id == great.user_id){
      var current_user = `<li>
                            <a href="/tweets/${great.id}/edit" data-method="get" >編集</a>
                          </li>
                          <li>
                            <a href="/tweets/${great.id}" data-method="delete" >削除</a>
                          </li>`
    } else {
      var current_user = ""
    }

    var html = `<div class="content_post" style="background-image: url(${great.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/tweets/${tweet.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${tweet.text}</p><br>
                  <span class="name">
                    <a href="/users/${tweet.user_id}">
                      <span>投稿者</span>${tweet.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
</script>