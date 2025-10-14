
2025年度「データベース工学」の RDBMS (PostgreSQL) に関する教材です。

## 動作環境

この教材は、次の環境で動作確認を行なっています。

- OS: Windows 11 (WSL2)
- Docker Desktop: 4.48
- Node.js: 24.8
- Git: 2.51.0.windows.1
- Visual Studio Code: 1.105

## セットアップ手順

### リポジトリのクローン

次のコマンドで、このリポジトリをクローンします。

```bash
git clone https://github.com/TakeshiWada1980/DB-2025-PostgreSQL.git
cd DB-2025-PostgreSQL
```

上記のコマンドを実行すると、カレントフォルダのなかに `DB-2025-PostgreSQL` というフォルダが作成され、そこにプロジェクトが展開されます。

クローン先のフォルダ名を変更したいときは (例えば `hoge` というフォルダを新規作成して、そこに展開にしたいときは)、次のようにしてください。

```bash
git clone https://github.com/TakeshiWada1980/DB-2025-PostgreSQL.git hoge
cd hoge
```

### 依存関係のインストール

次のコマンドを実行して、プロジェクトの実行に必要なパッケージをインストールしてください。`npm i` は `npm install` の短縮形です。

```bash
npm i
```

### 環境変数の設定

プロジェクトのルートフォルダに `.env` (環境変数の設定ファイル) を新規作成してください。`.env.dummy` を参考に、次のように PostgreSQL への接続文字列を記述してください。

```env
DATABASE_URL="postgresql://student:secret123@localhost:5432/playground?schema=public"
```

上記の接続文字列は `docker/docker-compose.yaml` のデフォルト設定に対応しています。もし、`docker/docker-compose.yaml` を変更しているときは、次の各パラメータを変更してください。

- `student` : 学習用 PostgreSQL のユーザ名
- `secret123` : 学習用 PostgreSQL のパスワード
- `playground` : 学習用 PostgreSQL のデータベース名

### リモートリポジトリの設定

[GitHub](https://github.com/) に空の **パブリックリポジトリ** を作成してください。このとき、`README.md`、`.gitignore`、`LICENSE` などは含めずに、**完全に空の状態で作成**するようにしてください。

- リポジトリの例: `https://github.com/xxxx/DB-PostgreSQL.git`

次のコマンドで、教材提供のリモートリポジトリを `upstream` という名前に変更します。

```bash
git remote rename origin upstream
```

つづいて、自分のリモートリポジトリを `origin` という名前で追加し、初回の `push` を実行します。

```bash
git remote add origin https://github.com/xxxx/DB-PostgreSQL.git
git push -u origin main
```

ウェブブラウザから、https://github.com/xxxx/DB-PostgreSQL.git にアクセスして、プッシュに成功していることを確認してください。

#### 教材の更新を取得するとき

教材リポジトリ (`upstream`) に更新があった場合は、次のコマンドで最新の変更を取得してください。

```bash
git fetch upstream
git switch main
git merge upstream/main
```

マージ処理の際には、以下のようにエディタが自動的に起動します。内容を確認したうえで、「続行」ボタンを押下してください。

![img](./docs/figs/readme/git-01.png)

マージ完了後、`MERGE_MSG` のタブは閉じて問題ありません。その後、VSCodeの「変更の同期」のボタンを押下して、自分のリモートリポジトリ (`origin`) に変更を反映させます。

#### 自分の GitHub に演習課題などを保存するとき

演習や課題の取り組みを、自分のリモートリポジトリに保存するときは、次のコマンドを実行してください。

```bash
git add .
git commit -m "任意のコミットメッセージ"
git push
```

## 教材の使用方法

### 準備: Docker Desktop の起動確認

タスクトレイのアイコンから Docker Desktop が起動していることを確認してください。

### 準備: PostgreSQL と DbGate の起動

VSCode でプロジェクトフォルダを開き、`[Ctrl]+[J]` を押下してターミナル (PowerShell) を起動してください。つづいて、次のコマンドを実行して PostgreSQL と DbGate の Dockerコンテナ を起動してください。

```bash
npm run db:up
```

これは `package.json` の `scripts` に定義されたコマンドで、実際には次のコマンドが実行されます。

```bash
docker compose -f docker/docker-compose.yaml -p pg17dev up -d --wait
```

### SQLファイルの実行

SQLファイルは、拡張子を `.sql` として、基本的に `sql` フォルダのなかに配置してください。必要に応じて`sql` フォルダのなかにサブフォルダを作成してください。

例えば、`sql/03/create-s_users.sql` というファイルを作成したときは、次のコマンドで SQLファイル が実行できます。

```bash
npm run sql sql/03/create-s_users.sql
```

また、`.vscode/tasks.json` にビルドタスクを定義しているので、`create-s_users.sql` のエディタタブがアクティブな状態で `[Ctrl]+[Shift]+[B]` を押下することで、上記コマンドを実行することができます。

### TypeScriptファイルの実行

TypeScriptファイルは、基本的に `src` フォルダのなかに、必要に応じてサブフォルダを作成して配置してください。

例えば、`src/samples/helloWorld.ts` というファイルを作成したときは、次のコマンドで実行ができます。

```bash
npx tsx src/samples/helloWorld.ts
```

また、ファイルの変更を検知して自動的に再実行したい場合 (=ホットリロードを利用する場合) は、次のコマンドを使用してください。停止する場合は、ターミナル上で `[Ctrl+C]` を入力してください。

```bash
npx tsx watch src/samples/helloWorld.ts
```

または、次のように npm スクリプト経由で実行することもできます。

```bash
npm run dev src/samples/helloWorld.ts
```

### DbGate の利用

ウェブブラウザで `http://localhost:8080/` にアクセスすることで DbGate を利用できます。DbGateは、データベースの内容を視覚的に確認したり、SQL を実行したりできるウェブベースのGUIツールです。

### PostgreSQL と DbGate の停止

次のコマンドで、コンテナを停止します。

```bash
npm run db:down
```

コンテナを停止しても、データベース内のデータは Docker のボリュームに保存されたまま残ります。そのため、次回 `npm run db:up` でコンテナを再起動すれば、前回のデータをそのまま利用できます。

データベースを初期状態に戻したい場合 (ボリュームを含めてすべて削除したい場合) は、次のコマンドを実行してください。

```bash
npm run db:reset
```

**補足**: `npm run db:reset` を実行すると、これまでに作成したテーブルやデータがすべて消去されます。演習をやり直したいときや、データベースの状態をクリーンにしたいときに使用してください。