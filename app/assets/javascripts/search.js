$(document).on('turbolinks:load', function () {
	$(function() {
		$('.js-text_field').on('keyup', function () {
			// キーボードを入力したタイミングで以下の処理を実行する
			let title = $.trim($(this).val());

			console.log(title); // 検索窓の値が取れているか確認if (title.length = 1) {
			if (title != "") {
        $.ajax({
					type: 'GET', // リクエストのタイプ
					url: '/greats/search', // リクエストを送信するURL
					data: { keyword: title }, // サーバーに送信するデータ
					dataType: 'json' // サーバーから返却される型
				})
	      .done(function (data) {
				  $('.js-messages').empty();
				  $(data).each(function(i,message) {
				    $('.js-messages').append(
					    `<div class="message">
						     <a href="/greats/${message.id}">${message.name}</a>
					     </div>`
					  );
				  });
				 });
      } else {
        $('.js-messages').empty();
      }
		});
	});
});