require_relative("../models/student")
require_relative("../models/house")
require('pry-byebug')

Student.delete_all
House.delete_all

house_g = House.new( { 'name' => 'Gryffindor'})
house_g.save
house_r = House.new( { 'name' => 'Ravenclaw'})
house_r.save
house_h = House.new( { 'name' => 'Hufflepuff'})
house_h.save
house_s = House.new( { 'name' => 'Slytherin'})
house_s.save

student1 = Student.new({ 'first_name' => "Harry", 'last_name' => "Potter", 'age' => 15, 'house_id' => house_g.id })
student1.save()
student2 = Student.new({ 'first_name' => "Dave", 'last_name' => "1", 'age' => 16, 'house_id' => house_h.id })
student2.save()
student3 = Student.new({ 'first_name' => "Dave", 'last_name' => "2", 'age' => 17, 'house_id' => house_r.id })
student3.save()
student4 = Student.new({ 'first_name' => "Dave", 'last_name' => "3", 'age' => 14, 'house_id' => house_s.id })
student4.save()

pry.binding
nil
