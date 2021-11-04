  const timer = {
    pomodoro: 25,
    shortBreak: 5,
    longBreak: 15,
    longBreakInterval: 4,
  }

  let interval;

  const mainButton = document.getElementById('js-btn');
  mainButton.addEventListener('click', () => {
    // ボタンの属性をaction変数に格納
    const { action } = mainButton.dataset;
    // 開始と等しければカウントダウン開始
    if (action === 'start') {
      startTimer();
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
      }
    }, 1000);
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
    // カウントダウン部分を更新
    updateClock();
  }

  function handleMode(event) {
    const { mode } = event.target.dataset;
  
    if (!mode) return;
  
    switchMode(mode);
  }

  document.addEventListener('DOMContentLoaded', () => {
    switchMode('pomodoro');
  });