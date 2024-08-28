class TriviaQuiz
  def initialize
    @questions = [
      { question: "What is the capital of France?", answer: "Paris" },
      { question: "What is 2 + 2?", answer: "4" }
    ]
    @score = 0
  end

  def play
    @questions.each do |q|
      puts q[:question]
      answer = gets.chomp
      if answer.downcase == q[:answer].downcase
        puts "Correct!"
        @score += 1
      else
        puts "Wrong! The correct answer is #{q[:answer]}."
      end
    end
    puts "Quiz finished! Your score: #{@score}/#{@questions.size}"
  end
end

TriviaQuiz.new.play
