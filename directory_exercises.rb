require 'io/console'

def input_students
  puts "Please enter a students' name and cohort"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    cohort = gets.chomp
    cohort = cohort == '' ? :november : cohort.to_sym
    
    puts "Please enter the hobbies of the student"
    hobbies = gets.chomp
    puts "Please enter the country of birth of the student"
    country_of_birth = gets.chomp
    puts "Please enter the height of the student"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth , height: height}
    puts "Now we have #{students.count} student" + (students.length == 1 ? '' : 's')
    puts "Please enter another name or just hit return twice to exit"
    name = gets.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy'.center(IO.console.winsize[1])
  puts '-------------'
end



def print(students)
  cohorts = []
  students.each do |student| 
    if !cohorts.include?(student[:cohort]) then cohorts.push(student[:cohort]) end
  end
  cohorts.each do |cohort|
    students.each do |student|
      if cohort == student[:cohort]
        puts "#{cohort.to_s.capitalize} cohort: #{student[:name]} (hobbies are: #{student[:hobbies]}, from #{student[:country_of_birth]}, #{student[:height]}cm tall)"
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student" + (students.length == 1 ? '' : 's')
end

def interactive_menu
  loop do
    puts "1. Input the student"
    puts "2. Show the student"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end


students = input_students
print_header
print(students)
print_footer(students)

