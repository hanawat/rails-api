# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# Authors Data
Author.create(:name => 'Hanawa Takuro')
Author.create(:name => 'Ikemoto Yoshifumi')
Author.create(:name => 'Inomata Takeshi')

# Articles Data
3.times do |n|
  Article.create(:title => "Boobs is Good Ver.#{n}", :author_id => n + 1, :status => "true")
end

