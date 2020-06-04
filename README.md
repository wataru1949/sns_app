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
主に社会人の利用者を想定した、スポーツ活動を活性化させる目的のSNSアプリです。<br>
コンセプトは、『個人でもメンバー募集、イベント参加が気軽にできること』、『自身が所属するサークル等でのコミュニケーションが充実すること』を主要な機能としてアイデアを練りました。
<br><br><br>
## 機能
- アカウント作成後、ユーザーは個人、またはサークル等の活動において参加者を募集するための投稿をすることができます。<br>
- 投稿の詳細ページでは、閲覧者がテキストのみ、もしくは画像付きのコメントを残すことが出来ます。<br>
- ユーザーは個人での投稿だけでなく、グループを作成して他のユーザーをメンバーに追加することができます。<br>
- グループのページでは、メンバー間で画像を含んだチャット機能を使うことが出来ます。
- 未ログイン時は、投稿の閲覧のみできるようにしています。
<br><br><br>
## 使用言語
- Ruby:2.6.3
- Ruby on Rails:5.2.4.2
- Haml,Sass(Scss)
<br><br>
## 開発環境
- macOS(Catalina)
- VScode
- MySQL
<br><br>
## 本番環境
- Amazon EC2
- Amazon S3
- Nginx
- Unicorn
- MySQL
<br><br>
## 今後追加する予定の機能
- 現在グループ作成時に既存ユーザー全員から選択してメンバーを追加するようになっているので、グループページから申請をして許可が降りたら参加できる形にします。
- カテゴリー機能（スポーツの種目）を作り、ユーザーはお気に入りのカテゴリーを登録することができるようにする。投稿の一覧はお気に入りに関連するものが表示されるようにする。
- JSでコメント投稿時と検索時の非同期の動きを実装。その他必要に応じてプルダウンやモーダルも考える。
- サイドバーにコメントなどの通知を表示させる。
- ユーザー間のメッセージ機能は思案中。
<br><br>
## DB設計
![image](https://user-images.githubusercontent.com/61773347/83620584-7698f780-a5c8-11ea-9e1a-c6b929a5e9f7.png)




