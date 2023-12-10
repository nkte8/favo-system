README.md
# 管理方法  

## terraform(develop)の実行方法

[tflocal/README/md](tflocal/README.md)を参照  

## terraform(prod)の実行方法

コンテナで実行する

- initの実施
```sh
docker run --rm --env-file $PWD/terraform/.env -v $PWD/terraform:/terraform -w /terraform -u `id -u`:`id -g` -it hashicorp/terraform:1.6.5 init
```

参考:  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs