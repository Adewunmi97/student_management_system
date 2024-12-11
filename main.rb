require_relative 'studentManager'

manager = StudentManager.new
manager.add_student("Amanda", 22, "female")
manager.add_student("Michael Smith", 23, "male")
manager.find_student("Amanda", 1)
# manager.remove_student("Amanda", 1)
manager.add_grade_to_student(2, "Math", 90)
manager.add_grade_to_student(2, "Math", 85)
manager.find_student("Charlie", 3)
manager.save_students_data
manager.load_students_data