class Student
  attr_accessor :name, :age, :gender, :ave_grade
  attr_reader :id
  def initialize(id, name, age, gender)
    @id = id
    @name = name
    @age = age
    @gender = gender
    @grades = {}
  end

  def calc_grade_average(subject)
    sum = 0
    if @grades[subject] && @grades[subject].all? {|score| score.between?(0,100)}
      @grades[subject].each {|g| sum += g}
       @ave_grade = sum / @grades[subject].size.to_f
    else
      puts "Invalid grades for #{subject} or no grades available."
      return nil
    end
  end

  def add_grades(subject, score)
    @grades[subject] ||= []
    if score.is_a?(Numeric)
        @grades[subject] << score
      calc_grade_average(subject)
    else 
      puts "Grade must be an integer or a float number"
    end
  end 
end 


