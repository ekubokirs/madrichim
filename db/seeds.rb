# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.destroy_all

Admin.create([
	{email:'emilia@ctjmb.org', password: 'abc', password_confirmation: 'abc', first_name:"Emilia", last_name:"Kubo Kirschenbaum"},
	{email:'assistant@ctjmb.org', password: 'abc', password_confirmation: 'abc', first_name: "Amir", last_name: "Orbach"},
	{email:'rabbi.carrie@ctjmb.org', password: 'abc', password_confirmation: 'abc', first_name:"Carrie", last_name:"Benveniste"}
])