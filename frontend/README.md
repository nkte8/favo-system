## reactの実行方法

- reactのセットアップ
    - nodeのバージョンはCloudflareと合わせること。
```sh
docker run --rm -v $PWD:/src -w /src -u `id -u`:`id -g` -p 80:3000 -it node:18.17.1 npm install
```

- node.jsコンテナを起動
    - nodeのバージョンはCloudflareと合わせること。
```sh
docker run --rm -v $PWD:/src -w /src -u `id -u`:`id -g` -p 80:3000 -it node:18.17.1 /bin/bash
```

- nodejs実行方法
```sh
# 仮想DOM実行
npm run start
```
