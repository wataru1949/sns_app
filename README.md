# Gather
<br>

## アプリ紹介
主に社会人の利用者を想定した、気軽なスポーツコミュニティへの参加を目的とするSNSアプリです。<br>
コンセプトは、『イベントへの参加やメンバー募集などが気軽にできる』、『所属するサークル等でのコミュニケーションが充実する』。この2つを念頭においてアイデアを練りました。
<br><br><br>

## 制作背景
私自身は趣味で地元のソフトボールチームに所属しています。市内の他のチームとも交流があるのですが、どこのチームでもメンバーが集まらない日があったり、逆に予定がない日は他のチームの応援に行ったりしています。そのようなコミュニティの人手不足に対するニーズと、運動経験があっても地域との繋がりが薄く、活動する機会がないという人を結び付けたいと思い、このアプリを制作するにしました。<br>
野球に限定してしまうと週末の活動が中心になってしまうので、平日の仕事終わりなどに少人数でも気軽に交流できるようにするための投稿機能を考えました。
<br><br><br>
## DB設計
![](https://i.gyazo.com/c5c84245bae72b03b3f4974fd130fd65.png)
<br><br><br>
## ネットワーク•サーバ構成
![image](https://user-images.githubusercontent.com/61773347/98107811-63bf8180-1ede-11eb-80c7-e797b1e78b9c.png)
<br><br><br>
## 機能
### ユーザー機能
- ログインしない状態でも投稿の閲覧はできる。
- ユーザー情報は登録後に編集するができる。
<br>

### 投稿機能
- フォームでは関連する複数モデルのレコード（アドレス、カテゴリー）を登録できる。
- 投稿は、投稿したユーザーのみ編集、削除できる。
<br>

### コメント機能
- ログイン済みのユーザーのみ投稿に対してコメント（画像、テキスト）できる。
- コメントは編集不可。自身のコメントのみ削除できる。
<br>

### グループ機能
- グループとユーザーは多対多の関係
- フォームでは関連する複数モデルのレコード（アドレス、カテゴリー、画像）を登録できる。
- 画像は3枚まで関連付けられる。
- グループを作成したユーザーは、そのグループの管理者となる。
- グループ情報は管理者ユーザーのみ編集できる。
- ユーザーは、グループを検索して参加申請を送るができる。
- ユーザーは、グループの管理者から招待を受けた場合、『参加』、もしくは『拒否』するができる。
- 拒否した場合、グループの管理者にはそれが伝わらない。
<br>

### グループメンバー管理機能
- グループの管理者は、ユーザーを検索してグループに招待するができる。
- また、参加済みのメンバーを退会させるができる。
- グループの管理者は、ユーザーから来た参加申請に対して『参加許可』、もしくは『拒否』をするができる。
- 拒否した場合、ユーザーにはそれが伝わらない。
<br>

### チャット機能
- グループに所属するメンバーのみ、ページ内でチャット（画像、テキスト）のレコードを作成できる。
- チャット機能は非同期で作成、表示される。
- チャットは編集不可。自身が作成したチャットレコードのみ削除できる。
<br>

### カテゴリー機能
- 投稿とグループに結びつくカテゴリーレコードは、既存の物であればそれが使われ、無ければ新しく作られる。
- カテゴリー用のフォームでは、インクリメンタルサーチで該当レコードが表示される。
<br>

### 検索機能
- 複数の属性（アドレス、カテゴリー、日にち）で投稿を検索するができる。
- 複数の属性（アドレス、カテゴリー、グループ名）でグループを検索するができる。
- ニックネームからユーザーを検索するができる。
- グループの検索はログインユーザーのみ。
- 検索時は、各入力値から曖昧検索される。
<br><br><br>
### 投稿詳細ページ
[![Image from Gyazo](https://i.gyazo.com/3c39fde85ce48b274191fc8e41c208ee.gif)](https://gyazo.com/3c39fde85ce48b274191fc8e41c208ee)
<br><br><br>
### グループ詳細ページ
[![Image from Gyazo](https://i.gyazo.com/34056f487180ea422386d302b13d85b2.gif)](https://gyazo.com/34056f487180ea422386d302b13d85b2)
<br><br><br>

### メンバー管理ページ
[![Image from Gyazo](https://i.gyazo.com/0010add3b162dbd4da556dc2919cf03d.gif)
<br><br><br>

## 本番環境
- **アドレス**:https://gather.mt-watar.com/
- **BASIC認証**
  - ID：first
  - Pass：2062
- **テスト用アカウント**
  - メールアドレス:vito@example.com
  - パスワード：vitoco
<br><br><br>
## 使用言語
- Ruby:2.6
- Ruby on Rails:5.2
- Haml,Sass(Scss)
- JavaScript(JQuery)
<br><br><br>
## 使用技術
- Amazon Web Service
  - EC2
  -  RDS
  - S3
  -  Route53
  - Elastic Load Balancing
  - Certificate Manager
- Docker
- Docker Compose
- Nginx
- Unicorn
- Capistrano
- MySQL
<br><br><br>
## 開発ツール
- macOS(Catalina)
- Visual Studio code
- Trello
- Notion
- Draw.io
<br><br><br>
## 今後追加する予定の機能
- サイドバーにコメントなどの通知を表示させる。
- イベント機能を作り、グループページで管理できるようにする。
- お気に入りやユーザー間のメッセージ機能は思案中。






