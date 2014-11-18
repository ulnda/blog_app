# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
Comment.delete_all

user1 = User.create!(name: 'John Smith')
user2 = User.create!(name: 'Alan Gordon')

12.times { |i| user1.posts.create!(title: "Some title #{ i }", content: "Some content #{ i }") }
user1.posts.each { |post| 5.times { |i| user2.comments.create!(content: "Some comment #{ i }", post: post) } }