# URL
https://pomosto.herokuapp.com/
# サービス概要
リモートワークの方に
ポモドーロテクニックを使用した
休憩時間にストレッチをするサービスです。

# メインのターゲットユーザー
- リモートワークや在宅作業で座っている時間が増えた人。
- どうにか体を動かす理由が欲しい人。

# ユーザーが抱える課題
- 自宅だとメリハリをつけて作業ができない。
- 肩こり、腰痛に悩む。
# 解決方法
- ポモドーロテクニックとストレッチを取り入れることによって課題に集中して取り組める。

# 使用画面
|リスト作成ボタンからリスト作成|リストの中にカードを作成することができる|
|---|---|
|[![Image from Gyazo](https://i.gyazo.com/41ee330e60a42793161813939d35300e.png)](https://gyazo.com/41ee330e60a42793161813939d35300e)|
|[![Image from Gyazo](https://i.gyazo.com/63ca7db9478f91529f85f6d1e999396e.png)](https://gyazo.com/63ca7db9478f91529f85f6d1e999396e)|

|スタートボタンを押すとポモドーロを開始|タイマーが完了すると音が鳴り、ストレッチボタン表示|
|---|---|
|[![Image from Gyazo](https://i.gyazo.com/23fb68f993c343fc5fb8ec16df77f206.png)](https://gyazo.com/23fb68f993c343fc5fb8ec16df77f206)|
|[![Image from Gyazo](https://i.gyazo.com/73dd710627d0b4a120fee36abc5ef643.png)](https://gyazo.com/73dd710627d0b4a120fee36abc5ef643)|

|4回ポモドーロを行うと15分休憩|プロフィールページで合計、本日、１週間のポモドーロ数を確認できます|
|---|---|
|[![Image from Gyazo](https://i.gyazo.com/368483b93fd3edae6015a5c0db6c02a0.png)](https://gyazo.com/368483b93fd3edae6015a5c0db6c02a0)|
|[![Image from Gyazo](https://i.gyazo.com/4d399e2d45bf070744d0b9abf1acbf51.png)](https://gyazo.com/4d399e2d45bf070744d0b9abf1acbf51)|

# ER図
[![Image from Gyazo](https://i.gyazo.com/7b65a40e1ccbb3e6e6b52449dd75021d.png)](https://gyazo.com/7b65a40e1ccbb3e6e6b52449dd75021d)

# 主な使用技術
## バックエンド
- ruby 3.0.0
- rails 6.1.3

## フロントエンド
- HTML
- css(SCSS)
- Javascript(jQuery)
- Bootstrap5
- Font Awesome

## Gem
- sorcery(ログイン認証)
- chartkick(グラフ)
- groupdate(グラフ)
- rspec-rails(テスト)