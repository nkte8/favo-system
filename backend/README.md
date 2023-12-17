README.md
# 管理方法  

詳しくは[lambda/README/md](lambda/README.md)を参照 

```sh
docker run --rm -it --env-file $PWD/env/.env -v $PWD/lambda:/src -w /src --entrypoint /bin/bash public.ecr.aws/lambda/python:3.11
```

# インフラ関連

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
alias tflocal="docker run -v \${PWD}/terraform:/app -v \${PWD}/lambda:/app/lambda --rm --net=localstack_default -u \$(id -u):\$(id -g) -it tflocal:0.16.0" 
alias tflocal >> $HOME/.bashrc
tflocal init
```

## terraform(prod)の実行方法

コンテナで実行する

- initの実施
```sh
alias terraform="docker run --rm -v \${PWD}/env:/env -v \${PWD}/terraform:/app -v \${PWD}/lambda:/app/lambda -w /app -u \$(id -u):\$(id -g) -it hashicorp/terraform:1.6.5"
alias terraform >> $HOME/.bashrc
terraform init
```

`-var-file`を用いて本番環境向けの設定の読み込みを行う
```sh
terraform plan -var-file=/env/.env.tfvars
```

参考:  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs