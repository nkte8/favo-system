
## lambda用pythonコンテナ

実行方法
```sh
docker run --rm -it -v $PWD/lambda:/src -w /src --entrypoint /bin/bash public.ecr.aws/lambda/python:3.11
```

layersのインストール方法
```sh
docker run --rm -it -v $PWD/lambda:/src -w /src --entrypoint /bin/bash public.ecr.aws/lambda/python:3.11
pip download -r ./requirements.txt -d ./layers/python/
```

参考:  
https://techblog.styleedge.co.jp/entry/2022/08/05/164135