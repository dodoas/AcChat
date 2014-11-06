# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
    :first_name => "Admin First Name",
    :last_name => "Admin Last Name",
    :email => "admin@admin.com",
    :password => "123456789",
    :password_confirmation => "123456789"
)
User.where(name: 'Admin First Name').add_role :admin