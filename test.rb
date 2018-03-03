class Test
  attr_reader :test_result, :answer_s

  def initialize
    @current_path = File.dirname(__FILE__)
    @question_file_path = "#{@current_path}/data/question.txt"
    if File.exist?(@question_file_path)
      @f = File.new(@question_file_path,'r:UTF-8')
      @lines = @f.readlines #выдает массив строк
      @f.close
    else
      puts 'Файл не найден'
    end
    @questions  = @lines
    @answer_s = "1. да \n2. нет \n3. иногда \n"
    @answer_weight = {1=>2,2=>0,3=>1}
    @test_result = 0
  end

  def  get_user_answer
    loop do
      @answer = STDIN.gets.to_i
      break unless @answer_weight[@answer] == nil
      puts "Неверно набран ответ"
    end
    @test_result +=  @answer_weight[@answer]
  end


  def next_question(number_question)
     @questions.at(number_question)
  end

  def size
    @questions.size
  end
end
