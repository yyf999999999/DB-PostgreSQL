

## セットアップ手順

### リポジトリのクローン

次のコマンドで、このリポジトリをクローンします。

```bash
git clone https://github.com/TakeshiWada1980/DB-2025-PostgreSQL.git
cd DB-2025-PostgreSQL
```

上記のコマンドを実行すると、カレントフォルダ内に `DB-2025-PostgreSQL` というフォルダが作成され、そこにプロジェクトが展開されます。

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

上記は `docker/docker-compose.yaml` のデフォルト設定に対応しています。もし、`docker/docker-compose.yaml` を変更しているときは、接続文字列の各パラメータを変更してください。

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

ウェブブラウザから、https://github.com/xxxx/DB-PostgreSQL.git にアクセスして、問題なくプッシュできていることを確認してください。

#### 教材の更新を取得するとき

教材リポジトリが更新されたときは、次のコマンドで最新の変更を取得してください。

```bash
git fetch upstream
git switch main
git merge upstream/main
```

- `git switch main` は `git checkout main` と同じです。

#### 自分の GitHub に演習課題などを保存するとき

演習や課題の取り組みを、自分のリモートリポジトリに保存するときは、次のコマンドを実行してください。

```bash
git add .
git commit -m "任意のコミットメッセージ"
git push
```

## 利用方法

Windows 環境を想定した説明です。

### Docker Desktop の起動確認

タスクトレイから Docker Desktop が起動していることを確認してください。

### PostgreSQL と DbGate の起動

VSCode でプロジェクトフォルダを開き、`[Ctrl]+[J]` を押下してターミナル (PowerShell) を起動してください。つづいて、次のコマンドを実行して PostgreSQL と DbGate のコンテナを起動してください。

```bash
npm run db:up
```

これは `package.json` の `scripts` に定義されたコマンドで、実際には次のコマンドが実行されます。

```bash
docker compose -f docker/docker-compose.yaml -p pg17dev up -d --wait
```

### SQLファイルの実行

基本的に `sql` フォルダのなかに適当なサブフォルダを作成し、拡張子を `.sql` としたファイルに SQL を記述してください。

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

ウェブブラウザで `http://localhost:8080/` にアクセスすることで、DbGateを利用できます。DbGateは、データベースの内容を視覚的に確認したり、SQLを実行したりできるGUIツールです。

### PostgreSQL と DbGate の停止

次のコマンドで、コンテナを停止します。

```bash
npm run db:down
```

これは、データが ボリューム という仕組みで永続化されているためです。次回 `npm run db:up` でコンテナを起動すると、前回のデータがそのまま利用できます。もし、データベースを初期状態に戻したいとき (ボリュームを含めてすべて削除したいとき) は、次のコマンドを実行してください。

```bash
npm db:reset
```

**補足**: `npm db:reset` を実行すると、これまでに作成したテーブルやデータがすべて消去されます。演習をやり直したいときや、データベースの状態をクリーンにしたいときに使用してください。