class Game
    attr_accessor :name
    def initialize(n)
      @name = n
    end
    def printName
      puts name
    end 

    def start(p1, p2) 
    player1 = Player.new(p1)
    player2 = Player.new(p2)
        while player1.lives > 0 && player2.lives > 0
            question(player1)
            break if player1.lives < 1
            question(player2)
        end
        winner = player1.lives > 0 ? player1 : player2
        puts "-- GAME OVER -- "
        puts "#{winner.name} won! with #{winner.lives} #{winner.lives == 1 ? 'life' : 'lives'} remaining"
        return 'Play Again?'
    end 

    def question(player)
    num1 = (rand() * 20).floor
    num2 = (rand() * 20).floor
    question = "#{player.name}: What does #{num1} plus #{num2} equal?"
    puts "---------------------------------------------------------"
    puts "#{player.name}'s turn, you have #{player.lives} #{player.lives == 1 ? 'life' : 'lives'} remaining"
    puts "---------------------------------------------------------"
    puts question
     answer = gets.chomp 
    puts ""
      if (num1 + num2 == answer.to_i)
        puts "yep that's right"
        puts "lives: #{player.lives}/3"
      else
        player.lives -= 1
        puts "nope that's wrong"
        puts "lives: #{player.lives}/3"
      end
    end
  end