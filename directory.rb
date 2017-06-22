# Global array for student details
@students = []

# Interactive menu for capturing and displaying user data
# An interactive menu for the user
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# Printing the menu for the user interactive menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

# Get user input
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

# List of questions for input
def questions()
  puts "Please enter a students name"
  puts "Press enter twice to finish"
  @name = STDIN.gets.chomp
  case @name
  when ""
    puts "All done"
  else
    puts "What cohort are they in?"
    @cohort = STDIN.gets.chomp
  end
end

# Pushing question answers into a hash / array
def input_students
  questions
  while !@name.empty? do
    push_students(@name, @cohort)
    puts "We now have #{@students.count} #{student_numbers(@students.count)}"
    questions
  end
  @students
end

def push_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

#Calling methods for showing student details
def show_students
  print_header
  print_student_list
  print_footer
end

# Printing captured user data to the console
# Printing the header
def print_header
  puts "Students"
  puts "-------------"
end

# Printing the names to console
def print_student_list
  length = @students.length
  count = 0
  # While loop to loop through each student
  while count != length
    name = @students[count]
    # Only print names that begin with 'P' less than 12 characters long
    if name[:name][0] != "" && name[:name].length < 22
      # Call the print_student method
      print_student(count, name)
      count += 1
    else
      count = 0
      break
    end
  end
end

# Printing student details
def print_student(count, name)
  s_number = "#{count + 1}"
  s_name = "#{name[:name]}"
  s_cohort = "#{name[:cohort]}"
  puts "Student number: #{s_number.ljust(0)}"
  puts "Name: #{s_name.rjust(20)}"
  puts "Cohort: #{s_cohort.rjust(20)}"
  puts
end

# Printing only November Cohort
def print_cohort
  puts "NOVEMBER COHORT"
  @students.map do |i|
    if i[:cohort] == "November"
      puts "Name: #{i[:name]}"
      puts "Origin: #{i[:cohort]}"
      puts
    end
  end
end

# Formatting the word 'student'
def student_numbers(num)
  num == 1 ? "student" : "students"
end

# Printing the footer
def print_footer
  puts "Overall, we have #{@students.count} great #{student_numbers(@students.count)}"
end

# Read / Write of CSV file of student data
# Saving data to a CSV
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Loading student data from a CSVs
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    push_students(name, cohort)
  end
  file.close
end

# Attempt to ope students file
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} student files from #{filename}"
  else
    load_students(students.csv)
    puts "Loading #{filename} as default"
  end
end

try_load_students
interactive_menu
