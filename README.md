使い方

使いたいRAILSのリポジトリをクローンします

```
$ git clone git@github.com:shinofara/sample-rail5.git ./src
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
