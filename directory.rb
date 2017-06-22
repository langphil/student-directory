@students = []
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
  while !@name.empty? do
    @students << {name: @name, cohort: @cohort, born: @born, hobby: @hobby}
    puts "We now have #{@students.count} #{student_numbers(@students.count)}"
    questions
  end
  @students
end

# Formatting the word 'student'
def student_numbers(num)
  num == 1 ? "student" : "students"
end

# Printing the menu for the user interactive menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

# Get user input
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

# An interactive menu for the user
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
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
def print_cohort
  puts "NOVEMBER COHORT"
  @students.map do |i|
    if i[:cohort] == "November"
      puts "Name: #{i[:name]}"
      puts "Origin: #{i[:cohort]}"
      puts "Cohort: #{i[:born]}"
      puts "Hobby: #{i[:hobby]}"
      puts
    end
  end
end

# Printing the names to console
def print_student_list
  length = @students.length
  count = 0
  # While loop to loop through each student
  puts "NEW STUDENTS BEGINNING WITH 'P'"
  while count != length
    name = @students[count]
    # Only print names that begin with 'P' less than 12 characters long
    if name[:name][0] == "P" && name[:name].length < 12
      # Call the print_student method
      print_student(count, name)
      count += 1
    else
      count = 0
      break
    end
  end
end

# Printing the footer
def print_footer
  puts "Overall, we have #{@students.count} great #{student_numbers(@students.count)}"
end

interactive_menu
