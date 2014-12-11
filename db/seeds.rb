# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO Get seed data in here
Student.delete_all
Student.create(name: "Grace E Abel", dob: DateTime.new(2009,04,17), addr1: "87/120 Uxbridge Street", addr2: "Grange", postcode: "4051", email: "sorcha@gmail.com" )

# TODO use factory girl for seed data
#  use sequences on attributes i.e. email to ensure differences
#  5.times do FactoryGirl.create(:student) end

Term.delete_all
Term.create(year_term: 1, student_id: 1, amt_paid: 10, location: "Grange" )

Result.delete_all
Result.create(student_id: 1, term_id: 1, grade: 89)

Question.delete_all
Question.create(name: "Sorcha Keane", email: "Sorcha@gmail.com", dob: DateTime.new(1980,06,02), location: "Grange", comment: "hi there")

Administrators.delete_all
Administrators.create(first_name: "Sorcha", last_name: "Abel", email: "sorchakeane@hotmail.com", username: "sabel", password: "secret" )


