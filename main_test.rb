require_relative "print_test_result"
require_relative "test"

VERSION = "Тест \"Ваш уровень общительности\". Версия 0.2. \n\n"
name = ARGV[0]
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end
if name == nil
  name = "anonimus"
elsif name == "-v"
  puts VERSION
  exit
end

puts "Добрый день, #{name}! Тест поможет определить ваш уровень коммуникабельности. \n" \
     "Для этого необходимо правдиво ответить на следующие вопросы. \n\n"

current_path = File.dirname(__FILE__)
question_file_path = "#{current_path}/data/question.txt"
if File.exist?(question_file_path)
  test = Test.new(question_file_path)
else
  puts 'Файл не найден'
  exit
end

test.size.times do |question_number|
  puts test.next_question(question_number)
  puts test.ANSWER #Варианты ответов
  test.get_user_answer
end

print_result = PrintTestResult.new
print_result.print_result(test.test_result)
