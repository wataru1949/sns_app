# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Gather
## アプリ紹介
主に社会人の利用者を想定した、気軽なスポーツコミュニティへの参加を目的とするSNSアプリです。<br>
コンセプトは、『個人でもメンバー募集、イベント参加が気軽にできること』、『自身が所属するサークル等でのコミュニケーションが充実すること』を主要な機能としてアイデアを練りました。
<br><br><br><br>
![image](https://user-images.githubusercontent.com/61773347/83836708-4455da00-a72f-11ea-8896-73b237a02388.png)
<br><br>
![f6e87c89208a6a24af3dafba49247e65](https://user-images.githubusercontent.com/61773347/83991175-f20ef600-a986-11ea-85c3-841c504bf799.gif)
<br><br><br>
## 制作背景
私は趣味でソフトボールチームに所属しているのですが、市内で交流のあるどこのチームもメンバーそれぞれの都合によって人が集まらない日があり、助っ人を呼んだり、逆に応援に行ったりして試合を行うようにしています。そのようなコミュニティの人手不足に対するニーズと、運動経験があっても地域との繋がりが薄く活動する機会がない人とを結び付けたいと思い、このアプリを制作することにしました。野球に限定してしまうと週末の活動が中心になってしまうので、平日の仕事終わりなどに少人数でも気軽に交流できるようにするための投稿機能を考えました。
<br><br><br>
## 機能
- アカウント作成後、ユーザーは個人、またはサークル等の活動において参加者を募集するための投稿をすることができます。<br>
- 投稿の詳細ページでは、閲覧者がテキストのみ、もしくは画像付きのコメントを残すことが出来ます。<br>
- ユーザーは個人での投稿だけでなく、グループを作成して他のユーザーをメンバーに追加することができます。<br>
- グループのページでは、メンバー間で画像を含んだチャット機能を使うことが出来ます。
- 未ログイン時は、投稿の閲覧のみできるようにしています。
<br><br><br>
## 本番環境
- IPアドレス:54.238.40.30
- BASIC認証
  - ID：first
  - Pass：2062
<br><br><br>
## テスト用アカウント
- http://54.238.40.30/
- メールアドレス:vito@gmail.com
- パスワード：vitoco
<br><br><br>
## 使用言語
- Ruby:2.6.3
- Ruby on Rails:5.2.4.2
- Haml,Sass(Scss)
<br><br><br>
## 開発環境
- macOS(Catalina)
- VScode
- MySQL
<br><br><br>
## 使用技術
- Amazon EC2
- Amazon S3
- Nginx
- Unicorn
- Capistrano
- MySQL
<br><br><br>
## DB設計
![image](https://user-images.githubusercontent.com/61773347/83620584-7698f780-a5c8-11ea-9e1a-c6b929a5e9f7.png)
<br><br><br>
## 今後追加する予定の機能
- 現在グループ作成時に既存ユーザー全員から選択してメンバーを追加するようになっているので、グループページから申請をして許可が降りたら参加できる形にします。
- カテゴリー機能（スポーツの種目）を作り、ユーザーはお気に入りのカテゴリーを登録することができるようにする。投稿の一覧はお気に入りに関連するものが表示されるようにする。
- JSでコメント投稿時と検索時の非同期の動きを実装。その他必要に応じてプルダウンやモーダルも考える。
- サイドバーにコメントなどの通知を表示させる。
- ユーザー間のメッセージ機能は思案中。






