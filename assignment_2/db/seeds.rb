# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

accounts = [
{first_name: "Carly", last_name: "Fiorina", birth: 1954, gender: "female"},
{first_name: "Donald", last_name: "Trump", birth: 1946, gender:"male"},
{first_name: "Ben", last_name: "Carson", birth: 1951, gender: "male"},
{first_name: "Hillary", last_name: "Clinton", birth: 1947, gender: "female"}
]

counter = 0
accounts.each do |login|
	user = User.create! username: login[:last_name], password_digest: "password#{counter}"	
	user.create_profile! gender: login[:gender], birth_year: login[:birth], first_name: login[:first_name], last_name: login[:last_name]
	list = TodoList.create! list_name: "List#{counter}", list_due_date: Date.today+1.year
	user.todo_lists << list
	5.times do |item|
		todoitem = TodoItem.create! due_date: Date.today+1.year, title: "Title #{item}", description: "Description #{item}"
		list.todo_items << todoitem
	end
	#user.todo_lists.create! list_name: "List#{counter}", list_due_date: Date.today+1.year
	counter +=1
end