

  const timer = {
    pomodoro: 25,
    shortBreak: 5,
    longBreak: 15,
    longBreakInterval: 4,
  };

  // タイマー上のボタンを検出、モード切り替え
  const modeButtons = document.querySelector('#js-mode-buttons');
  modeButtons.addEventListener('click', handleMode);

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