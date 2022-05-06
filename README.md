# サブスクリプション管理サービスAPI

## 環境変数
```
DB_PATH=/data/{env}.sqlite3
REPLICA_URL=<s3 URI>
LITESTREAM_ACCESS_KEY_ID=********
LITESTREAM_SECRET_ACCESS_KEY==********
```
## 起動
```
$ docker build . -t sub-api
$ docker run --rm -d -p 8000:8000 --name sub-api --env-file=.env.local sub-api
```

## データの永続化について
- sqliteを使用
- Litestreamでs3にレプリケーション、リストア
