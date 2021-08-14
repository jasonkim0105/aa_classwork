# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
 Cat.destroy_all
 apple = Cat.create!(birth_date: '17/01/2020', color: 'black', name: 'apple', sex: 'F', description: "I am a dog")

 banana = Cat.create!(birth_date: '18/01/2020', color: 'yellow', name: 'banana', sex: 'F', description: "I am a fruit")

 orange = Cat.create!(birth_date: '19/01/2020', color: 'white', name: 'orange', sex: 'M', description: "I am round")





end

