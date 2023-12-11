
## tflocalビルド方法

コンテナビルド
```sh
docker build -t tflocal:0.16.0 tflocal/
```

tflocal実行
```sh
docker run --rm --net=localstack_default -it -v $PWD/terraform:/app tflocal:0.16.0 init
```

alias登録すると使いやすい
```sh
alias tflocal="docker run --rm --net=localstack_default -it -v $PWD/terraform:/app tflocal:0.16.0"
```

参考:  
https://zenn.dev/ry_km/articles/best-way-to-dev-lambda  
https://github.com/localstack/terraform-local/tree/main  
