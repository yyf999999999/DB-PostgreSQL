

## Docker の操作

### データベース (PostgreSQLコンテナとDgGateコンテナ) を起動する

```bash
npm run db:up
```

```bash
docker compose -f docker/docker-compose.yaml -p pg17dev up -d --wait
```

### データベース (PostgreSQLコンテナとDgGateコンテナ) を停止する

```bash
npm run db:down
```

```bash
docker compose -f docker/docker-compose.yaml -p pg17dev down
```

### データベースを停止して保存領域も削除する

```bash
npm run db:reset
```

```bash
docker compose -f docker/docker-compose.yaml -p pg17dev down --volumes
```