class Hangman

  def initialize
  #  @letters = ('a'..'z').to_a
    @word = words.sample
    @lives  = 7
    # @correct_guesses = []
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
     end
  end

  def words
     [
       [ "cricket" ,  "A game played by gentlemen" ],
       ["jogging" , "we are not walking..."],
       ["celabrate" , "Remembering special moment"],
     ]
  end

  def print_teaser last_guess = nil
    # word_teaser = ""
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|

      if letter == '_' && @word.first[index] == last_guess
       new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join('  ')
  end

      def make_guess
        if @lives > 0
        puts "Enter a letter"
        guess = gets.chomp

        good_guess  = @word.first.include? guess

        if guess == "exit"
          puts "Thank you for playing game."
        elsif good_guess
          puts "Your letter is correct. Good Guess!!"


          # @correct_guesses << guess

          # @letters.delete guess

          print_teaser guess

          if @word.first == @word_teaser.split.join
            puts "Congratulations.. You have won the peacefull time in game"
          else
            make_guess
          end
        else
          @lives -= 1
          puts "Sorry .. You have #{ @lives } lives left. try again"
          make_guess
        end
      else
        puts "Game over.... better luck next time"
      end
    end

  def begin
     puts "New game started... Your clue is #{ @word.first.size } character long"
     puts "To exit the game at any point please type 'exit'"
     print_teaser

  puts "clue: #{ @word.last }"

  make_guess
 end

end


  #puts "You guessed #{guess}"


game = Hangman.new
game.begin
