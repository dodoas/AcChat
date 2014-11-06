# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.first_name = "Admin"
user.last_name = "Admin"
user.email = "admin@admin.com"
user.password = "123456789"
user.password_confirmation = "123456789"
user.save
user.add_role :admin