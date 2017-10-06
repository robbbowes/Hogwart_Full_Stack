require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/student.rb')

#INDEX
get '/hogwarts' do
  erb(:index)
end

#NEW
get '/hogwarts/new' do
  @houses = House.all
  erb(:new)
end

#CREATE
post '/hogwarts' do
  @students = Student.new(params)
  erb(:create)
end

# READ

get '/hogwarts/all' do
  @students = Student.all
  erb(:all)
end

get '/hogwarts/:id/edit' do
  @student = Student.find_id(params['id'])
  erb(:edit)
end

post '/hogwarts/:id' do
  student= Student.new(params)
  student.update()
  redirect to "/hogwarts/#{params['id']}"
end
