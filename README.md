# アプリ実行環境構築手順書
#### 目次
0. 事前準備
0. githubからソースコードをPullする
0. .envファイルを作成
0. Dockerイメージをビルドする
0. docker composeコマンドでコンテナを起動
0. RailsアプリのDBを作成
0. アプリにアクセス
0. Postmanを使用してAPI機能の確認

※macOSを前提とした手順書です。
##### WindowsOSの方は、Dockerを使えるようにするために、WSLなどLinuxコマンドを実行できる環境が必要です。下記記事の「Docker Desktop起動」まですすめてください（チュートリアルは実施しなくて問題ありません）。
https://chigusa-web.com/blog/windows%E3%81%ABdocker%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%97%E3%81%A6python%E7%92%B0%E5%A2%83%E3%82%92%E6%A7%8B%E7%AF%89/


## 1.事前準備

##### Docker公式HPより、自身のOSにあったDockerをインストールする。
https://docs.docker.com/get-docker/


Dockerのバージョン確認
```terminal
$ docker -v
Docker version 20.10.14, build a224086
```
Dockerのバージョンが確認できれば、インストール完了です。

##### Postman公式HPより、PCのOSにあったPostmanをインストールする。

https://www.postman.com/downloads/

以上で事前準備は終了です。

## 2. GithubからソースコードをPullする

### 作業ディレクトリの作成
実行用ディレクトリを作成して安全にプロジェクトを実行できるようにします。
```terminal
$ mkdir rails_short_url_pj
$ cd rails_short_url_pj
$ pwd
/Users../../../short_url_api #作業ディレクトリにいることを確認
```

### Gitを準備し、Githubよりソースコードをgit　pullで取得する
Gitを使用可能にして、ソースコードをリモートリポジトリからPullします。
```terminal
$ git init
$ git version
git version 2.32.1 (Apple Git-133) #これが表示されればGitが使えるようになります
$ git pull https://github.com/yosnak13/short_url_api
$ ls
Makefile    backend      docker-compose.yml      frontend
# 上記の4つのファイルが表示されていれば成功です。
```


## 3. .envファイルの作成
環境変数を活用するために作成します。

```terminal
$ touch .env
```
.envファイルを作成したら、下記内容をコピー&ペーストしてください。

```.env
WORKDIR=app
MYSQL_ROOT_PASSWORD=password
```
Dockerfileに記載されているWORKDIRの値とDBコンテナに必要なPasswordが記載されてます。

## 4. Dockerイメージをビルドする
docker composeコマンドを使用して、コンテナイメージをビルドします。

```terminal
$ docker compose build
```

## 5. コンテナを起動
イメージがビルドできたら、バックグラウンドでコンテナを立ち上げます。
```terminal
$ docker compose up -d
```

## 6. RailsアプリのDBを作成
このままではdbが存在せずアプリケーションが起動できないため、backendコンテナに入って、railsコマンドを使用してdbの作成とdbのマイグレーションを実行します。

##### dbの作成
```terminal
$ docker compose exec backend rails db:create
Created database 'short_url_api_development'
Created database 'short_url_api_test'
```

##### dbのマイグレーション
```terminal
$ docker compose exec backend rails db:migrate
== 20220602135511 CreateUrls: migrating =======================================
-- create_table(:urls)
   -> 0.0829s
== 20220602135511 CreateUrls: migrated (0.0833s) ==============================
```

##### マイグレーションステータスの確認
```terminal
$ docker compose exec backend rails db:migrate:status
database: short_url_api_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20220602135511  Create urls
```
上記が表示されていれば成功です。

## 7. アプリにアクセス
下記URLにアクセスして、railsの画面が出れば成功です。
http://localhost:3000

![スクリーンショット 2022-06-12 22.04.14.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/674242/4f9d3394-ab6d-bfce-51d1-2d551de30e13.png)

## 8.Postmanを使用してAPI機能の確認
PCにインストールしたPostmanを起動して、Workspacesタブから「create Workspace」をクリックして新規のワークスペースを作成。Workspace名、description、Visibilityは自由に設定してください。作成したら、＋タブをクリックしてhttpリクエストを操作できる画面になりますので、あとはURL入力に「http://localhost:3000/urls」などを入力し、API操作してください。
