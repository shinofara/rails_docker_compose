使い方

使いたいRAILSのリポジトリをクローンします

```
$ git clone https://github.com/shinofara/sample-rail5.git ./src
```

Docker Build

```
$ make
```

Docker RUN

```
$ make up
```

http://localhost/

### PHP MY ADMIN

http://localhost:18080/


### Mail Catcher

メールブラウザ
http://localhost:1080/

SMTP設定

| 項目   | 値         |
| ------ | ---------- |
| ポート | 1025       |
| ホスト | rails_smtp |

### generate

```
docker-compose run --rm rails_app bundle exec rails generate scaffold AdminUser name:string mail:string
```

注意

```
# .bundle/config
BUNDLE_DISABLE_SHARED_GEMS: '1'
```

この行を削除しないと、rakeなどは共通gemを見に行ってパニックを起こします
