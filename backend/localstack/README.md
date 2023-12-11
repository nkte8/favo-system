
## Localstack実行方法

docker-composeのインストール方法
```sh
sudo su -
DOCKER_CONFIG=/usr/local/lib/docker
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version
```

Localstackの起動  
```sh
docker compose -f ./localstack/docker-compose.yml up
```

参考:  
https://qiita.com/takmot/items/648f35c04e0717a4a6fe  
https://hub.docker.com/r/localstack/localstack/  
https://qiita.com/takapg/items/5c1ee7f8645effb9e37b
