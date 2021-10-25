$(document).on('turbolinks:load', function() { 
  var c = 5; //ランダムに表示するiframe内URLの数
  var ifm = document.getElementById('youtube');
  var r = Math.floor(Math.random() * c);
  var urls = new Array();
  urls[0] = 'https://www.youtube.com/embed/JVOu8FzP94k?start=11&end541';
  urls[1] = 'https://www.youtube.com/embed/2ve-gyPA6d0?start=22&end=257';
  urls[2] = 'https://www.youtube.com/embed/zS_jc5j9wRQ?start=21&end=257';
  urls[3] = 'https://www.youtube.com/embed/f2_PLjc6iqs?start=20&end=313';
  urls[4] = 'https://www.youtube.com/embed/3cN0XATgV8U?end=257';
  ifm.src = urls[r];
});

(function($) {
  $.fn.timer = function(totalTime) {
    // reset timer
    clearTimeout(this.data('id_of_settimeout'));
    this.empty();
    
    // initialize elements
    this.append('<div class="progress" style="height: 20px;"></div>');
    this.children('.progress').append('<div class="progress-bar bg-success"></div>');
    this.find('.progress-bar').css({
        cssText: '-webkit-transition: none !important; transition: none !important;',
        width: '100%'
    });

    var countdown = (function(timeLeft) {
      var $progressBar = this.find('div.progress-bar');
      var $header = this.children('h2');

      if (timeLeft <= 0) {
        $header.empty().text('休憩時間が終了しました。').addClass('text-danger');
        return;
      }

      $header.children('span').text(timeLeft);

      var width = (timeLeft - 1) * (100/totalTime); // unit in '%'
      if (width < 10) { // less than 10 %
        $progressBar.removeClass();
        $progressBar.addClass('progress-bar bg-danger');
      } else if (width < 20) { // less than 20 % (and more than 10 %)
        $progressBar.removeClass();
        $progressBar.addClass('progress-bar bg-warning');
      }

      $progressBar.animate({
        width:  width + '%'
      }, 1000, 'linear');

      var id = setTimeout((function() {
        countdown(timeLeft - 1);
      }), 1000);
      this.data("id_of_settimeout", id);
    }).bind(this);

    countdown(totalTime);
  };
})(jQuery);

$(window).on('load', function (e){
  e.preventDefault();

  var duration = $("#duration").val();
  $('#progress_bar').timer(300);
});
