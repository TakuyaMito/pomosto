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

const timer = {
  pomodoro: 0.1, // 25
  shortBreak: 0.1, // 5
  longBreak: 15,
  longBreakInterval: 4,
  sessions: 0,
  pomo_num: 0,
}

let interval;

const mainButton = document.getElementById('js-btn');
mainButton.addEventListener('click', () => {

  // ボタンの属性をaction変数に格納
  const { action } = mainButton.dataset;
  // 開始と等しければカウントダウン開始
  if (action === 'start') {
    startTimer();
  } else {
    stopTimer();
  }
});

// タイマー上のボタンを検出、モード切り替え
const modeButtons = document.querySelector('#js-mode-buttons');
modeButtons.addEventListener('click', handleMode);

function getRemainingTime(endTime) {
  const currentTime = Date.parse(new Date());
  // 終了時刻と現在時刻の差
  const difference = endTime - currentTime;

  const total = Number.parseInt(difference / 1000, 10);
  const minutes = Number.parseInt((total / 60) % 60, 10);
  const seconds = Number.parseInt(total % 60, 10);

  return {
    total,
    minutes,
    seconds,
  };
}

function startTimer() {
  let { total } = timer.remainingTime;
  // タイマー終了時間取得
  const endTime = Date.parse(new Date()) + total * 1000;

  // ポモドーロ開始時にsessionsを+1
  if (timer.mode === 'pomodoro') timer.sessions++;
  // ポモドーロ数を+1
  if (timer.mode === 'pomodoro') timer.pomo_num++;
  document.getElementById('pomo_number').textContent = timer.pomo_num;
  // タイマー開始するとactionとtextが停止に変更される
  mainButton.dataset.action = 'stop';
  mainButton.textContent = 'stop';
  mainButton.classList.add('active');

  interval = setInterval(function() {
    timer.remainingTime = getRemainingTime(endTime);
    updateClock();

    total = timer.remainingTime.total;
    if (total <= 0) {
      clearInterval(interval);

      switch (timer.mode) {
        case 'pomodoro':
          if (timer.sessions % timer.longBreakInterval === 0) {
            switchMode('longBreak');
          } else {
            switchMode('shortBreak');
          }
          break;
        default:
          switchMode('pomodoro');
      }
      // 切り替え時に通知音
      //webオーディオAPIコンテキストを生成
      const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
      //オシレーターノードを生成
      const oscillator = audioCtx.createOscillator();
      //ゲインの生成
      const gainNode = audioCtx.createGain();
      //webオーディオAPIコンテキストと接続
      oscillator.connect(gainNode);
      gainNode.connect(audioCtx.destination);
      //音量
      gainNode.gain.value = 0.2;
      //通知音のタイプ
      oscillator.type = 'sine';
      //通知音スタート
      oscillator.start();
      //通知音ストップ
      oscillator.stop(0.2);

      startTimer();
    }
  }, 1000);
}

function stopTimer() {
  // 一時停止
  clearInterval(interval);

  // actionとtextがstartに変更され、activeクラスが削除される
  mainButton.dataset.action = 'start';
  mainButton.textContent = 'start';
  mainButton.classList.remove('active');
}

function updateClock() {
  const { remainingTime } = timer;
  // minutes,secondsの数値が常に二桁に表示
  const minutes = `${remainingTime.minutes}`.padStart(2, '0');
  const seconds = `${remainingTime.seconds}`.padStart(2, '0');

  const min = document.getElementById('js-minutes');
  const sec = document.getElementById('js-seconds');
  min.textContent = minutes;
  sec.textContent = seconds;

  const text = timer.mode === 'pomodoro' ? 'Pomosto' : 'Take a break!';
  document.title = `${minutes}:${seconds} — ${text}`;

  const progress = document.getElementById('js-progress');
  progress.value = timer[timer.mode] * 60 - timer.remainingTime.total;
}


function switchMode(mode) {
  timer.mode = mode;
  timer.remainingTime = {
    // 残り秒数
    total: timer[mode] * 60,
    // ポモドーロ時間
    minutes: timer[mode],
    seconds: 0,
  };

  document
    .querySelectorAll('button[data-mode]')
    .forEach(e => e.classList.remove('active'));
    // 背景更新
  document.querySelector(`[data-mode="${mode}"]`).classList.add('active');
  document.body.style.backgroundColor = `var(--${mode})`;
  // プログレスバー
  document
    .getElementById('js-progress')
    .setAttribute('max', timer.remainingTime.total);
  // カウントダウン部分を更新
  updateClock();
}

function handleMode(event) {
  const { mode } = event.target.dataset;

  if (!mode) return;

  switchMode(mode);
  // モードが変更されたらタイマーが停止する
  stopTimer();
}

document.addEventListener('DOMContentLoaded', () => {
  switchMode('pomodoro');
});