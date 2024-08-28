class WordScramble
  def initialize(word)
    @word = word.downcase
    @scrambled = @word.chars.shuffle.join
  end

  def play
    puts "Unscramble the word: #{@scrambled}"
    loop do
      guess = gets.chomp.downcase
      if guess == @word
        puts "Congratulations! You've unscrambled the word."
        break
      else
        puts "Try again!"
      end
    end
  end
end

WordScramble.new("programming").play
