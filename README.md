## Introduction
ボットを置いて行きます  

## Directory structure
+ DiscordBot.rb  
ゲーマー向けのSkype,Slackの  
[Discord https://discordapp.com/](https://discordapp.com/) のボットです。  
汚いです。

## contents

### DiscordBot.rb
#### **Librarys,APIs**  
+ discordrb  
+ json  
+ open-uri  
+ gmail  
+ Weather Hacks - livedoor  
  
#### **Function**  
+ コマンドボット  
+ リアクションボット  
+ 特定のラベルの付いたgmailの本文を投稿[これ](https://github.com/uyamazak/gdrive_update_notifier)と併用することでGoogleDrive監視ボットになる
  
### discheck.sh
#### **Function** 
+ DiscorBot.rbの生死を確認する
+ 死んでいたら再起動する
+ 死んでいたらメールを送る
