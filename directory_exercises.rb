require 'io/console'

def input_students
  puts "Please enter a students' name"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    puts "Please enter the hobbies of the student"
  hobbies = gets.chomp
  puts "Please enter the country of birth of the student"
  country_of_birth = gets.chomp
  puts "Please enter the height of the student"
  height = gets.chomp
    students << {name: name, cohort: :november, :hobbies => hobbies, "country of birth" => country_of_birth , :height => height}
     if students.length == 1
      puts "Now we have #{students.count} student"
     else
      puts "Now we have #{students.count} students"
     end
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
  i = 0
  while i < students.length
      puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort #{students[i][:hobbies]})"
      i +=1
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end





students = input_students
print_header
print(students)
print_footer(students)

