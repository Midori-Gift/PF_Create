# [The way of Greate.](https://way-of-great.jp/)
  
![bandicam 2021-07-26 14-45-28-007](https://user-images.githubusercontent.com/81542430/126938956-13f7ff0e-911c-48f3-bd90-0281b8eb43f1.jpg)

## インフラ設計  
・インフラ設計書:https://docs.google.com/spreadsheets/d/1nbMjfRt5rJLvEKhZlCjxpfyYOA9dZLcOv12BwVYOCJc/edit?usp=sharing  
  
・AWS構成図  
  
![bandicam 2021-08-09 15-05-39-201](https://user-images.githubusercontent.com/81542430/128665709-179baef8-f14d-4a4d-9fa9-280cdc877489.jpg)  
  
## サイト概要  

偉人の言葉、なにかを成し遂げた人の言葉や考えは偉大です。  
きっとあなたが悩んだときに力になってくれます。  

時に自信と勇気を貰い、時に衝撃や叱咤の言葉を身に受けつつ。  
あなたの悩みが晴れて、前を向いていけるような出会いがあればと思います。  

### サイトテーマ

歩むべき道が分からなくなったとき  
偉人の考えや思想を学び  
道を示し、漠然とした不安を取り除けるようなサイトを目指す。  
簡易版twitter　+　Wikipedia　のような完成イメージです。  
twitter:https://twitter.com/?lang=ja  
wikipedia:https://ja.wikipedia.org/wiki/  

### テーマを選んだ理由

人間なら少なからずある悩みや葛藤、  
あなたは今まで「この悩みを他の人はどう考え、解決しているんだろう？」  
と考えたことは無いでしょうか？  

私はそういった個人が抱える悩みを取り払ってくれるような  
言葉や考えに出会える場があったらいいなと思い至り、 
このサイトを実現したいと考えました。  

### ターゲットユーザ

悩みを抱える人すべて(主なターゲットは 10 台後半~30 台中間)  

### 主な利用シーン

漠然とした不安や悩みを抱えている人が  
こんな悩みを持つ自分は変ではないか。  
こんなことを相談すれば周囲の人間に奇異の目で見られるのではないか 。  
同じような考えをもつ人はいないか？と悩んだ時に 

## 設計書

・UI フロー:https://drive.google.com/drive/folders/1dpUi9-YjQYAaAtCn-WAp3kN9Pi5DMFJ9?usp=sharing  
・テーブル定義書:https://docs.google.com/spreadsheets/d/1P1F0He2v1xRp11q9aJNNUmWC2K9revX4jw9LN44yG1c/edit?usp=sharing  
・アプリケーション詳細設計書:https://docs.google.com/spreadsheets/d/1odBx_Ifc7_QWoGOhMXxFKFfDWKERnaP_OZzZ-Atcf3w/edit?usp=sharing  

## 機能面
・CRUD  
・ログイン
・いいね機能  
・フォロー機能  
・コメント機能  
・検索機能  

※これら以外は下記のチャレンジ要素一覧リンクにまとめておきます。
  ↓↓↓↓↓
## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1uJiP9K4J5ki75B7jE0g9pBLbPRaEUsJERFRV90WrSZs/edit?usp=sharing  

-チャレンジ要素以外の挑戦  

・Git Actionを導入、ローカル環境からのpushを本番環境にも即時反映  
・ファビコンの設定  
・ドメイン取得 & HTTPS通信化  

## 開発環境

- OS：Linux(CentOS)  
- 言語：HTML,CSS,JavaScript,Ruby,SQL 
- フレームワーク：Ruby on Rails 
- JS ライブラリ：jQuery 
- IDE：Cloud9  

## 使用素材

https://commons.wikimedia.org/wiki/File:Drucker5789.jpg   
https://gahag.net/003300-albert-einstein/  
https://commons.wikimedia.org/wiki/File:Noguchi_Hideyo.jpg  
  
## 課題点 

１．デザイン面  
・メディアクエリが完璧でない。  

2.機能面  
・編集履歴が残らない。  
・名言が1件しか保存できない。   
・最初の投稿者がすべての編集をしてきたように見えてしまう。(履歴が残らないため。)  
・タグ付け機能が微妙
