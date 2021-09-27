$(document).on('turbolinks:load', function () {
	$(function() {
		$('.js-text_field').on('keyup', function () {

			let title = $.trim($(this).val());

			// 入力が開始されたタイミングで処理を開始
			if (title != "") {
				// ajaxで通信するための設定
        $.ajax({
					type: 'GET', // リクエストのタイプ
					url: '/greats/search', // リクエストを送信するURL(greatsコントローラーのsearchアクション)
					data: { keyword: title }, // サーバーに送信するデータ(コントローラー内 keywordにtitleを代入)
					dataType: 'json' // サーバーから返却される型
				})

				 // ajax処理が成功(文字の入力)すると、json形式のdata変数が代入される。
	      .done(function (data) {
	      	// 文字が入力されるたび.js-messages内の文字を削除(更新に近い)
				  $('.js-messages').empty();
				 //入力された値をデータ変数として取り出していく
				  $(data).each(function(i,message) {
				  	// appendで.js-messageを指定し、取得したdata変数を利用しリンクを生成する。
				    $('.js-messages').append(
					    `<div class="message">
						     <a href="/greats/${message.id}">${message.name}</a>
					     </div>`
					  );
				  });
				 });
      } else {
      	// もし、検索欄が空欄だったら何も表示させない
        $('.js-messages').empty();
      }
		});
	});
});