## reactの実行方法

- reactのセットアップ
    - nodeのバージョンはCloudflareと合わせること。
    - 仮想DOMでは80番のポートを使うと通信を継続してくれないため、デフォルトポートに変更
```sh
docker run --rm -v $PWD:/src -w /src -u `id -u`:`id -g` -p 3000:3000 -it node:18.17.1 npm install
```

- node.jsコンテナを起動
    - nodeのバージョンはCloudflareと合わせること。
    - 仮想DOMでは80番のポートを使うと通信を継続してくれないため、デフォルトポートに変更
```sh
docker run --rm -v $PWD:/src -w /src -u `id -u`:`id -g` -p 3000:3000 -it node:18.17.1 /bin/bash
```

- nodejs実行方法
```sh
# 仮想DOM実行
npm run start
```

## 参考  

https://typescriptbook.jp/tutorials/react-like-button-tutorial  
https://elsammit-beginnerblg.hatenablog.com/entry/2021/02/11/221720  
https://qiita.com/task-k/items/6286a2d9437cf6e182f0  