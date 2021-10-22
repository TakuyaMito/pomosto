window.onload = function() {
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
}