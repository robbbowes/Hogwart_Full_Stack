require_relative("../db/sql_runner")
require_relative("./house")

class Student

  attr_reader(:id)
  attr_accessor(:first_name, :last_name, :age, :house_id)

  def initialize(details)
    @id = details["id"].to_i
    @first_name = details["first_name"]
    @last_name = details["last_name"]
    @age = details["age"].to_i
    @house_id = details["house_id"].to_i
  end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, age, house_id) VALUES ($1, $2, $3, $4) RETURNING id;'
    values = [@first_name, @last_name, @age, @house_id]
    students = SqlRunner.run(sql, values).first
    @id = students['id'].to_i
  end

  def self.all ()
    sql = 'SELECT * FROM students;'
    values= []
    student_hash = SqlRunner.run(sql, values)
    students = student_hash.map { |student| Student.new(student) }
    return students
  end

  def self.find_id(id)
    sql = 'SELECT * FROM students WHERE id = $1;'
    values = [id]
    students_hash = SqlRunner.run(sql, values)
    student = Student.new( students_hash[0] )
    # students = student_hash.map { |student| Student.new(student) }
    return student
  end

  def self.delete_all()
    sql = 'DELETE FROM students;'
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM students WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE students SET (first_name, last_name, age, house_id) =
      ($1, $2, $3, $4) WHERE id = $5;'
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def house()
    sql = 'SELECT name FROM houses WHERE id = $1;'
    values = [@house_id]
    house_hash = SqlRunner.run(sql, values)
    house = house_hash.map { |thing| House.new(thing)}
    return house.first
    # house = House.new(house_hash)
    # return house
  end

end
