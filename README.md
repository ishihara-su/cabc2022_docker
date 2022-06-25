# Dockerfile for CABC2022

コンピュータ入門2022用のUbuntu 20.04 LTSベースの環境を作るDockerfile

作成: 石原進 2022/6/26

コンピュータ入門、およびシステム工学応用実習2021で使う/使ったツールをインストールし、さらに日本語化、タイムゾーンの設定をしたUbuntu 20.04 LTSの環境。userという名前のユーザが登録してあり、この一般ユーザ権限で動作する。sudo相当の作業をしたければ、```docker exec```でユーザをルートにして作業する。

## イメージの作成

```docker build . -t ishiharasusumu/bubuntu2004-cabc2022:v0.5```

## コンテナの実行

```docker run -it --name cabc2022 -h cabc_ubnt ishiharasusumu/ubuntu2004-cabc2022:v0.5```

## コンテナのアタッチ

```docker attach cab2022```

## ルートでの作業

```docker exec -it -u root -w / cabc2022 /bin/bach```

## メモ

Dockerのデフォルトでは、Ctrl+P, Ctrl+Pがデタッチ用のキーになっている。これはbashのemacsライクキーバインドと重なって不便なので、インタラクティブ環境では、デタッチ用のキーを別に設けた方が良い。石原の環境ではCtrl+G, Gtrl+Gに設定を変更している。

具体的には、```~/.docker/config.json```に```"detachKeys": "ctrl-g,ctrl-g"```というエントリを加えている。

