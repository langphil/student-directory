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

# Method to user input student names
def input_students
  puts "Please enter a students name"
  puts "To finish press enter twice"
  name = gets.chomp
  students = []

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "We now have #{students.count} students"
    name = gets.chomp
  end
  students
end

# Print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print the name
def print_name(names)
  length = names.length
  count = 0

  while count != length
    name = names[count][:name]
    cohort = names[count][:cohort]
    if name[0] == "P" && name.length < 12
      puts "Student number #{count + 1}: #{name} (#{cohort} cohort)"
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
  puts "Overall, we have #{names.count} great students"
end

# Call the methods
students = input_students
print_header
print_name(students)
print_footer(students)
