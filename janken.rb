
# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player

  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    # puts "0:グー, 1:チョキ, 2:パー"
    content = ["0:グー", "1:チョキ", "2:パー"] 
    content.each do |g|
      puts g 
    end
    while true
      input_hand = gets.to_i
      if input_hand == 0 || input_hand == 1 || input_hand == 2
        return input_hand
      else
        puts "0～2の数字を入力してください。"
        content.each do |g|
          puts g 
        end
        
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
     return rand(3)
    # グー、チョキ、パーの値をランダムに出力させます。
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。


class Janken
  # attr_accessor :pon
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    # puts "相手の手は#{janken[enemy_hand]}です。"

      # while false
        
        if (player_hand == enemy_hand)
          puts "あいこ"
            return true
          elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
            puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです"
            return false
          else
            puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです"
           return false
        end
      # end
 

      # if 条件を書く Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
      # 「あいこ」を出力します。
      # puts "あいこ"
      #「true」を返してじゃんけんを繰り返し実行させます。
        # ヒント！ 「return」を使用します。
    #  elsif もしも下記の組み合わせだった場合
      #  (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      # 「あなたの勝ちです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    #  else ※条件以外の場合
      # 「あなたの負けです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    # end if文のend
  end
end



# じゃんけんゲームを実行するロジックを書きます。
class Action
  # selfを使用することで、Actionをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    
    # 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
    # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
    next_game = true
    while next_game 
      next_game = janken.pon(player.hand, enemy.hand)
      

    #     # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
    #     # 「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
    #     # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了します。「true」が返ってくると、その回数だけ繰り返し続けます。
    # # while文のend
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
Action.jankenpon
