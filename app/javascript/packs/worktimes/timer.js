(function() {
  'use script';

  // タイマーと時間の要素をそれぞれ取得
  var timer = document.getElementById('timer');
  var sss = document.getElementById('3sec');
  var min = document.getElementById('10min');
  var short = document.getElementById('25min');
  var herf = document.getElementById('40min');
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
    timer.textContent = '残り' + m + '分' + s + '秒';
  }

  function countDown() {
    timerId = setTimeout(function() {
      // var elapsedTime = Date.now() - startTime;
      // timeLeft = timeToCountDown - elapsedTime;
      timeLeft = timeToCountDown - (Date.now() - startTime);
      // 残り時間が０になった時の処理
      if (timeLeft < 0) {
        isRunning = false;
        start.textContent = 'スタート';
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
      start.textContent = '一時停止';
    // スタートタイムを押した時の時刻を取得
    startTime = Date.now();
    // カウントダウンを実行
    countDown();
    } else {
      isRunning = false;
      start.textContent = '再開';
      timeToCountDown = timeLeft;
      clearTimeout(timerId);
    }
  });

  // 3秒のボタンを押した時の処理
  sss.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 3秒
    timeToCountDown = 1000 * 3;
    // 60分以上になったら0になる
    if (timeToCountDown >= 60 * 60 * 1000) {
      timeToCountDown = 0;
    }
    updateTimer(timeToCountDown);
  });

  // 10分のボタンを押した時の処理
  min.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 1分は60秒×1000ms
    timeToCountDown = 60 * 1000 * 10; 
    // 60分以上になったら0になる
    if (timeToCountDown >= 60 * 60 * 1000) {
      timeToCountDown = 0;
    }    
    updateTimer(timeToCountDown);
  });

  // 25分のボタンを押した時の処理
  short.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 25分
    timeToCountDown = 1000 * 60 *25;
    // 60分以上になったら0になる
    if (timeToCountDown >= 60 * 60 * 1000) {
      timeToCountDown = 0;
    }
    updateTimer(timeToCountDown);
  });

  // 40分のボタンを押した時の処理
  herf.addEventListener('click', function() {
    if (isRunning === true) {
      return;
    }
    // 40分
    timeToCountDown = 1000 * 60 * 40;
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

// モーダル
{
  const open = document.getElementById('open');
  const close = document.getElementById('close');
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');

  open.addEventListener('click', () => {
    modal.classList.remove('hidden');
    mask.classList.remove('hidden');
  });

  close.addEventListener('click', () => {
    modal.classList.add('hidden');
    mask.classList.add('hidden');
  });

  mask.addEventListener('click', () => {
    // modal.classList.add('hidden');
    // mask.classList.add('hidden');
    close.click();
  });
}

