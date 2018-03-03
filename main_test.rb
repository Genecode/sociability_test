require_relative "print_test_result"
require_relative "test"

version = "Тест \"Ваш уровень общительности\". Версия 0.2. \n\n"
name = ARGV[0]
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end
if name == nil
  name = "anonimus"
elsif name == "-v"
  puts version
  exit
end

puts "Добрый день, #{name}! Тест поможет определить ваш уровень коммуникабельности. \n" \
     "Для этого необходимо правдиво ответить на следующие вопросы. \n\n"

test = Test.new
test.size.times do |question_number|
  puts test.next_question(question_number)
  puts test.answer_s #Варианты ответов
  test.get_user_answer
end

PrintTestResult.new(test.test_result)
