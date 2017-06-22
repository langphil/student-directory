# List of questions for input
def questions()
  puts "Please enter a students name"
  puts "Press enter twice to finish"
  @name = gets.chomp
  case @name
  when ""
    puts "All done"
  else
    puts "Where were they born?"
    @born = gets.chomp
    puts "What is their favourite hobby?"
    @hobby = gets.chomp
  end
end

# Pushing question answers into a hash / array
def input_students
  questions
  students = []
  while !@name.empty? do
    students << {name: @name, cohort: :November, born: @born, hobby: @hobby}
    puts "We now have #{students.count} #{student_numbers(students.count)}"
    questions
  end
  students
end

# Formatting the word 'student'
def student_numbers(num)
  num == 1 ? "student" : "students"
end

# Printing the header
def print_header
  puts "Students"
  puts "-------------"
end

# Printing the names to console
def print_name(names)
  length = names.length
  count = 0

  while count != length
    name = names[count]
    if name[:name][0] == "P" && name[:name].length < 12
      s_number = "#{count + 1}:"
      s_name = "#{name[:name]}"
      s_cohort = "#{name[:cohort]}"
      s_birth = "#{name[:born]}"
      s_hobby = "#{name[:hobby]}"
      puts "Student number: #{s_number.ljust(0)}"
      puts "Name: #{s_name.rjust(20)}"
      puts "Origin: #{s_birth.rjust(20)}"
      puts "Cohort: #{s_cohort.rjust(20)}"
      puts "Hobby: #{s_hobby.rjust(20)}"
      puts
      count += 1
    else
      break
    end
  end
end

# Printing the footer
def print_footer(names)
  puts "Overall, we have #{names.count} great #{student_numbers(names.count)}"
end

# Calling the methods
students = input_students
print_header
print_name(students)
print_footer(students)
