# List of questions for input
def questions()
  puts "Please enter a students name"
  puts "Press enter twice to finish"
  @name = gets.chomp
  case @name
  when ""
    puts "All done"
  else
    puts "What cohort are they in?"
    @cohort = gets.chomp
    '''
    puts "Where were they born?"
    @born = gets.chomp
    puts "What is their favourite hobby?"
    @hobby = gets.chomp
    '''
  end
end

# Pushing question answers into a hash / array
def input_students
  questions
  students = []
  while !@name.empty? do
    students << {name: @name, cohort: @cohort, born: @born, hobby: @hobby}
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

# Printing student details
def print_student(count, name)
  s_number = "#{count + 1}"
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
end

# Printing only November Cohort
def print_cohort(names)
  names.map do |i|
    if i[:cohort] == "November"
      puts "NOVEMBER COHORT"
      puts "Name: #{i[:name]}"
      puts "Origin: #{i[:cohort]}"
      puts "Cohort: #{i[:born]}"
      puts "Hobby: #{i[:hobby]}"
      puts
    end
  end
end

# Printing the names to console
def print_name(names)
  length = names.length
  count = 0
  # While loop to loop through each student
  while count != length
    name = names[count]
    # Only print names that begin with 'P' less than 12 characters long
    if name[:name][0] == "P" && name[:name].length < 12
      # Call the print_student method
      puts "NEW STUDENT BEGINNING WITH 'P'"
      print_student(count, name)
      count += 1
    else
      count = 0
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
print_cohort(students)
print_footer(students)
