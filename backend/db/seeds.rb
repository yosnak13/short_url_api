# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  Url.create(
    original_url: "http://www.loooooooooooong.url.No.#{n + 1}.ne.jp",
    short_url: "short#{n + 1}"
  )
end
