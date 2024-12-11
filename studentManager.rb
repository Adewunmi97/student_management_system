require_relative 'student'
require 'json'

class StudentManager
  def initialize()
    @students = []
  end

  # this adds student
  def add_student(name, age, gender)
    if name.strip.empty? || age.to_i <= 0 || gender.strip.empty?
      puts "Error: invalid name or age or gender"
      return
    end
      id = @students.empty? ? 1 : @students.length + 1
      student = Student.new(id, name.strip.capitalize, age.to_i, gender.strip.capitalize)
      @students << student
      puts "A new student with name #{name}, has been added with id #{id}"
  end

  # this displays student information
  def display_student_info(student)
    "id: #{student.id}, Name: #{student.name}, Age: #{student.age}, Gender: #{student.gender}"
  end

  # this is a method to find student using their name or id
  def find_student(name, id)
    student_to_find = @students.find { |stud| stud.id == id || stud.name == name }
      if student_to_find
        puts display_student_info(student_to_find)
      else
        puts "student not found!"
      end
  end

  # this is a method to remove student by name or id
  def remove_student(name, id)
    student_to_remove = @students.find {|stud| stud.id == id || stud.name == name}
      if student_to_remove
        @students.delete(student_to_remove)
        puts "The student #{name} with id #{id} has been removed"
      else
        puts "Student not found!"
      end
  end

  # this add grades to student
  def add_grade_to_student(student_id, subject, grade)
    student = @students.find {|stud| stud.id == student_id}
    if student
      student.add_grades(subject, grade)
    else
      puts "student with id #{student_id} can not be found!"
    end
  end


  # this saves student data using JSON
  def save_students_data(file_name = 'students.json')
    data = @students.map do |student|
      {
        id: student.id,
        name: student.name,
        age:student.age,
        gender:student.gender
      }
    end.to_json
    File.open(file_name, 'w') do |file|
      file.write(data)
    end
    puts "Students are saved to #{file_name}"
  end


# this is to load student information from the file
  def load_students_data(file_name = 'students.json')
    existing_file = File.exist?(file_name)
    if existing_file
      json_data = File.read(file_name)
      @students = JSON.parse(json_data).map do |hash|
        Student.new(hash["id"], hash["name"], hash["age"], hash["gender"])
      end
      puts "Students loaded from #{file_name} file."
    end
  end
end


