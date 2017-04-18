# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destrong all messages"
Message.destroy_all
puts "Destroying all inquiries"
Inquiry.destroy_all
puts "Destroying all gibbers"
Gibber.destroy_all
puts "Destroying all users"
User.destroy_all

puts "Finding new ones"

ainaa = Gibber.new(
  first_name: "Ainaa",
  email: "ainaa@lewagon.com",
  password: "123456"
  )

ainaa.save

doug = Gibber.new(
  first_name: "Douglas",
  email: "douglas@lewagon.com",
  password: "123456"
  )

doug.save

ryo = Gibber.new(
  first_name: "Ryo",
  email: "ryo@lewagon.com",
  password: "123456"
  )

ryo.save

felix_user = User.new(
  first_name: "Felix",
  last_name: "the cat",
  email: "felixthecat@fakemail.com",
  password: "123456"
  )

felix_user.save

completed_inquiry = Inquiry.new(
  description: "I need a booking for 2 at a good izakaya in meguro for tomorrow",
  status: "completed",
  live: false,
  credits: 1,
  gibber_id: 1,
  user_id: 1,
  email: felix_user.email,
  first_name: felix_user.first_name
  )

completed_inquiry.save

pending_inquiry = Inquiry.new(
  description: "Need to find English speaking doctor in Shinjuku",
  status: "pending",
  live: false,
  credits: 1,
  email: "george@fakemail.com",
  first_name: "George"
  )

pending_inquiry.save

puts "..Done"
