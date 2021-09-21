# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.new({username:"alpha",password:"alpha",email:"alpha.io"})
user2 = User.new({username:"bravo",password:"bravo",email:"bravo.io"})
user3 = User.new({username:"charlie",password:"charlie",email:"charlie.io"})
user4 = User.new({username:"delta",password:"delta",email:"delta.io"})
user5 = User.new({username:"echo",password:"echo",email:"echo.io"})
user6 = User.new({username:"foxtrot",password:"foxtrot",email:"foxtrot.io"})

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!
user6.save!