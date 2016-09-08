使い方

当リポジトリをクローン

```
$ git clone https://github.com/shinofara/rails_docker_compose.git /path/to/workspace
$ cd /path/to/workspace
```

使いたいRAILSのリポジトリをクローンします

```
$ git clone https://github.com/shinofara/sample-rail5.git ./src
```

Docker Build

```
$ make
```

途中sudoで実行されるので、passwordの入力が必要

Docker RUN

```
$ make up
```

http://localhost/
https://localhost/

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
