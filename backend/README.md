README.md
# 管理方法  

詳しくは[lambda/README/md](lambda/README.md)を参照 

# インフラ関連

## localstackの実行方法

詳しくは[localstack/README/md](localstack/README.md)を参照 

Localstackの起動  
```sh
# 起動
docker compose -f ./localstack/docker-compose.yml up -d
# ログをstdoutに出力
docker compose -f ./localstack/docker-compose.yml logs -f
```

## terraform(develop)の実行方法

詳しくは[tflocal/README/md](tflocal/README.md)を参照  

provider.tfにて、backendをlocalに変更
```diff
-	backend "s3" {
-		bucket  = "favo-system"
-		region  = "ap-northeast-1"
-		key     = "terraform.tfstate"
-		encrypt = true
-	}
+	backend "local" {
+	 	path = "tflocal.tfstate"
+	}
```

`tflocal init`によりtfstateをlocal向けに初期化
```sh
alias tflocal="docker run -v \${PWD}/terraform:/app --rm --net=localstack_default -u \$(id -u):\$(id -g) -it tflocal:0.16.0" 
alias tflocal >> $HOME/.bashrc
tflocal init -reconfigure
```

コマンド実行準備OK
```sh
tflocal plan
```

## terraform(prod)の実行方法

provider.tfにて、backendをs3に変更
```diff
+	backend "s3" {
+		bucket  = "favo-system"
+		region  = "ap-northeast-1"
+		key     = "terraform.tfstate"
+		encrypt = true
+	}
-	backend "local" {
-	 	path = "tflocal.tfstate"
-	}
```

`terraform init`によりtfstateをlocal向けに初期化
```sh
. export
alias terraform="docker run --rm -e AWS_ACCESS_KEY_ID=\${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=\${AWS_SECRET_ACCESS_KEY} -v \${PWD}/env:/env -v \${PWD}/terraform:/app -w /app -u \$(id -u):\$(id -g) -it hashicorp/terraform:1.6.5"
alias terraform >> $HOME/.bashrc
terraform init -reconfigure
```

コマンド実行準備OK
```sh
terraform plan
```

参考:  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs