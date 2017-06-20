# Array of student hashes
'''
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
'''
# Print the student questions
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

# Push the student details to a 'Hash'
# Return the hash of students and their details
def input_students
  questions
  students = []
  while !@name.empty? do
    students << {name: @name, cohort: :November, born: @born, hobby: @hobby}
    puts "We now have #{students.count} students"
    questions
  end
  students
end

# Print the header
def print_header
  puts "Students"
  puts "-------------"
end

# Print student namess
def print_name(names)
  length = names.length
  count = 0

  while count != length
    name = names[count][:name]
    cohort = names[count][:cohort]
    birth = names[count][:born]
    hobby = names[count][:hobby]
    if name[0] == "P" && name.length < 12
      s_number = "Student number #{count + 1}:"
      s_name = "#{name}"
      s_cohort = "#{cohort}"
      s_birth = "#{birth}"
      s_hobby = "#{hobby}"
      puts s_number.ljust(0)
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

'''
  names.each_with_index do |name, index|
    if name[:name][0] == "P" && name[:name].length < 12
      puts "Student number:#{index + 1} #{name[:name]} (#{name[:cohort]} cohort)"
    else
      break
    end
  end
end
'''
end

# Print the footer
def print_footer(names)
  # print "Overall, we have #{names.count} great student"
end

# Call the methods
students = input_students
print_header
print_name(students)
print_footer(students)
