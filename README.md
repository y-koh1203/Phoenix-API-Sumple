# PhoenixでAPI
phx.gen.jsonでAPIを作ってみた

## 参考
- https://qiita.com/akameco/items/1920e351328b1cc0ace3
- https://qiita.com/piacere_ex/items/3e8d2dd3a0a8d4c3ba0c
- https://qiita.com/piacere_ex/items/b6d67d4fd628565979e4

## 手順
```
$mix ecto.create
$mix phx.gen.json Api Sumple sumple field1;string field2:text
※ $mix phoenix.gen.json Sumple sumple hoge:string fuga:string
上記の記述でも実行は可能だが、deprecatedな記述であり、追加したControllerが使用できなくなるため使うべきではない

$mix phx.migrate
``'

