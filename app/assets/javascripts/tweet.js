$(function(){
  function buildHTML(tweet){
    var html = `
      <div class="main-tweet__contents__content__block">
        <div class="main-tweet__contents__content__block--text">
          ${tweet.content}
        </div>
        <div class="main-tweet__contents__content__block__rightBox">
          <div class="main-tweet__contents__content__block__rightBox--name">
            ${tweet.name}
          </div>
          <div class="main-tweet__contents__content__block__rightBox--postDate">
            ${tweet.created_at}
          </div>
        </div>
      </div>
    `
    return html;
  }
  $('#new_tweet').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(tweets){
      var html = buildHTML(tweets);
      console.log(html);
      $('.main-tweet__contents__content').append(html);
      $('.main-tweet__contents__messages--text').val('');
      $('.main-tweet__contents__messages--btn').prop('disabled', false);
      $('.main-tweet__contents__content').animate({ scrollTop: $('.main-tweet__contents__content')[0].scrollHeight});
      }
    )
    .fail(function(){
      alert('error');
    })
  });
});