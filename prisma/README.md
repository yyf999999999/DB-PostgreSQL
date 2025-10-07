
## Prisma (ORM) を使用するための準備

### Step 1

このフォルダのなか `schema.prisma` を作成して以下を記述して保存する。

```
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
```

### Step 2

必要に応じて (DBスキーマが更新されたら) `npx prisma db pull` を実行する。

- あらかじめ `npm run db:up` で PostgreSQL コンテナを立ち上げておくこと。

### Step 3

Step.2 を実行したときは `npx prisma generate` を実行する。

### Step 4

Step.3 を実行したときは VSCode のコマンドパレット (`[Ctrl]+[P]`) から `> Developer: Reload Window` を実行する。

