README.md
# 管理方法  

## localstackの実行方法

詳しくは[localstack/README/md](localstack/README.md)を参照 

Localstackの起動  
```sh
docker compose -f ./localstack/docker-compose.yml up
```

## terraform(develop)の実行方法

詳しくは[tflocal/README/md](tflocal/README.md)を参照  

tflocal実行
```sh
alias tflocal="docker run --rm --net=localstack_default -it -v $PWD/terraform:/app tflocal:0.16.0"
tflocal init
```

## terraform(prod)の実行方法

コンテナで実行する

- initの実施
```sh
alias terraform="docker run --rm --env-file $PWD/terraform/.env -v $PWD/terraform:/terraform -w /terraform -u `id -u`:`id -g` -it hashicorp/terraform:1.6.5"
terraform init
```

参考:  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs