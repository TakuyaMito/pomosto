(function() {
  'use script';

  // タイマーと時間の要素をそれぞれ取得
  var timer = document.getElementById('timer');
  var min = document.getElementById('min');
  var sec = document.getElementById('sec');
  var reset = document.getElementById('reset');
  var start = document.getElementById('start');

  // スタートタイムを宣言
  var startTime;
  // 残り時間
  var timeLeft;
  // 全体の時間
  // var timeToCountDown = 4 * 1000; 4秒
  var timeToCountDown = 0;
  // ClearTimeoutの引数を渡すために宣言
  var timerId;
  // 一時停止のため
  var isRunning = false

  // tでm秒を渡す
  function updateTimer(t) {
    var d = new Date(t);
    // Dateオブジェクトから分、秒を取り出す
    var m = d.getMinutes();
    var s = d.getSeconds();
    var ms = d.getMilliseconds();
    // スライスで末尾を取り出す
    m = ('0' + m).slice(-2);
    s = ('0' + s).slice(-2);
    ms = ('00' + ms).slice(-3);

    // タイマーの中身を文字列で表現する
    timer.textContent = m + '分' + s + '秒' + ms;
  }

  function countDown() {
    timerId = setTimeout(function() {
      // var elapsedTime = Date.now() - startTime;
      // timeLeft = timeToCountDown - elapsedTime;
      timeLeft = timeToCountDown - (Date.now() - startTime);
      // 残り時間が０になった時の処理
      if (timeLeft < 0) {
        isRunning = false;
        start.textContent = 'Start';
        clearTimeout(timerId);
        timeLeft = 0;
        timeToCountDown = 0;
        updateTimer(timeLeft);
        return;
      }
      updateTimer(timeLeft)
      countDown();
    }, 10);
  }

  // スタートに対してイベント設定 クリックした時のイベント
  start.addEventListener('click', function() {

    if (isRunning == false) {
      isRunning = true;
      start.textContent = 'Stop';
    // スタートタイムを押した時の時刻を取得
    startTime = Date.now();
    // カウントダウンを実行
    countDown();
    } else {
      isRunning = false;
      start.textContent = 'Start';
      timeToCountDown = timeLeft;
      clearTimeout(timerId);
    }
  });

  // 分のボタンを押した時の処理
  min.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 1分は60秒×1000ms
    timeToCountDown += 60 * 1000; 
    // 60分以上になったら0になる
    if (timeToCountDown >= 60 * 60 * 1000) {
      timeToCountDown = 0;
    }    
    updateTimer(timeToCountDown);
  });

  // 秒のボタンを押した時の処理
  sec.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 1秒
    timeToCountDown += 1000;
    // 60分以上になったら0になる
    if (timeToCountDown >= 60 * 60 * 1000) {
      timeToCountDown = 0;
    }
    updateTimer(timeToCountDown);
  });

  // リセットボタンの処理
  reset.addEventListener('click', function() {
    timeToCountDown = 0;
    updateTimer(timeToCountDown);
  });
})();