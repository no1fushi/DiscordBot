puts "Loading require"
require "discordrb"
require "json"
require "open-uri"
require "gmail"
require "net/ping"
require "date"
puts "Loading require -Done!"

puts "Loading bot object"
bot = Discordrb::Commands::CommandBot.new token: "YourToken", client_id:  YourID, prefix: "!"
puts "Loading bot object -Done!"

puts "set permission"
ownid = YourID
bot.set_user_permission ownid, 1
USERNAME = "Gmail"
PASSWORD = "GmailPass"
puts "set permission -Done!"

#func
def execute_each_sec(sleep_sec)
  yield
  sleep sleep_sec
end

#System
	#kill
bot.command(:kill,permission_level: 1,description:"ボットを終了します[OwnerOnly]", usage: "<<kill") do |event|
  puts "called kill command"
  bot.send_message(channel_id=, "Shutting down...")
  bot.send_message(channel_id=, "Shutting down...")
  bot.stop
end

	#Description
bot.command(:hello, description: "このボットの説明") do |event| 
  event.respond "こんにちはかとぼっとです。"
  event.respond "管理者のサーバーが起動してるときのみ有効です。"
  event.respond "開発中のため機能はあまりありませんがリクエスト、アイデア等ありましたら@no1fushi #8076まで"
  event.respond "!コマンドの形で私を呼び出せます。"
  event.respond "!helpで実装されているコマンドがわかります。"
  event.respond "!help コマンド名でそのコマンドの説明を表示します"
  event.respond "また、特定の単語に反応します。"
  event.respond "!word で反応する単語の一覧を表示します"
end

	#reaction bot word list
bot.command(:word, description: "反応する単語一覧(実装順)") do |event|
  event.respond "含まれていたら反応するワード"
  event.respond "嘘つき,せっかち,ガルパン,ごちうさ,ココア,幻想,木原,乳首,草,淫夢"
  event.respond "その単語のみでないと反応しないワード"
  event.respond "離席,落ち,おかえり"
end

#command bot
	#Weather forecast
bot.command(:hwt, description: "釧路の今日の天気予報を表示します") do |event|
  uri = "http://weather.livedoor.com/forecast/webservice/json/v1?city=014020" #cityの数値で地域が変わる
  res     = JSON.load(open(uri).read)
  title   = res["title"]
  weather = res["forecasts"].first
  message = "[#{weather["date"]}の#{title}]は「#{weather["telop"]}」です。"
  event.respond message
end
	#What Day
bot.command(:wdi, description: "今日が何日か") do |event|
  tg = time.strftime("%Y/%m/%d :%A")
  event.respond "#{tg}"
end
	#What Time
bot.command(:wti, description: "今何時か") do |event|
    time = Time.now + (3600 * 2)
    tg = time.strftime("%H:%M:%S")
    event.respond "#{tg}"
end
	#ping
bot.command(:ping, description:"!ping hostname") do |event, host|
   time = DateTime.now
   now = "#{time.hour}:#{time.minute}:#{time.second}"
   pi = Net::Ping::External.new(host);
   if pi.ping?
      event.respond "#{now} PING OK: #{host}"
   else
      event.respond "#{now} PING NO: #{host}"
   end
end

	#Penis
bot.command(:ちんちん, description: "対策(ランダム)") do |event|
 rand = rand(6)
 if rand == 0
 	event.respond "乾杯"
 elsif rand == 1
	event.respond "かいかい"
 elsif rand == 2
	event.respond "電車"
 elsif rand == 3
	event.respond "ぞーさんぞーさんお鼻長い"
 else
	event.respond "びよーん"
 end
end
	#Person's name
bot.command(:シルフ, description: "崇めるか蹴落とすか呼ぶ") do |event|
 rand = rand(4)
 if rand == 0
 	event.respond "ないです"
 elsif rand == 1
	event.respond "一物大魔神"
 else
	event.respond "神様ぁぁぁぁ"
 end
end
	#Poo
bot.command(:うんち, description: "汚い") do |event|
  event.respond "うんちして"
end

#including reaction bot
	
bot.message(containing:"嘘つき") do |event|
  event.respond "ホモは嘘つき"
end

bot.message(containing:"せっかち") do |event|
  event.respond "ホモはせっかち"
end

bot.message(containing:"ガルパン") do |event|
  event.respond "ガルパンはいいゾー"
end

bot.message(containing:"幻想") do |event|
  event.respond "その幻想をぶち殺す!!"
end

bot.message(containing:"木原") do |event|
  event.respond "木ィィィ原くゥゥゥゥゥゥゥゥン!!"
end

bot.message(containing:"ごちうさ") do |event|
  event.respond "あぁ^～心がぴょんぴょんするんじゃぁ^～"
end

bot.message(containing:"ココア") do |event|
  event.respond "0言0́*)<ヴェアアアアアアアア"
end

bot.message(containing:"乳首") do |event|
  event.respond "乳首感じるんでしたよね?"
end

bot.message(containing:"草") do |event|
  event.respond "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
end

bot.message(containing:"淫夢") do |event|
  event.respond "114514"
end

#a word reaction bot
	#leave seat
bot.message(with_text: "離席") do |event|
  event.respond "いってらー"
end
	#See you
bot.message(with_text: "落ち") do |event|
  event.respond "ばいびー"
end
	#Welcome back
bot.message(with_text: "おかえり") do |event|
  event.respond "おかえりー"
end

bot.run :async

  #wakeup message
  bot.send_message(channel_id=, "Bot is now active!")
  bot.send_message(channel_id=, "Bot is now active!")
  puts "Bot is now active!"

  #Gmail drive monitoring
  loop do
    execute_each_sec(300) do ||
      gmail = Gmail.new(USERNAME,PASSWORD)
      mails =  gmail.mailbox("Label").emails.each do |mail|
      if !mail.text_part && !mail.html_part
        bot.send_message(channel_id=, mail.body.decoded.encode("UTF-8", mail.charset))
      elsif mail.text_part
        bot.send_message(channel_id=, mail.text_part.decoded)
      elsif mail.html_part
        bot.send_message(channel_id=, mail.html_part.decoded)
      end 
      mail.delete!
    end
    gmail.disconnect
    end
  end
bot.sync
