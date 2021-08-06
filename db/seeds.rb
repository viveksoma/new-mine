# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name:  "Sirushti")
# User.create!(name:  "Vivek")
# User.create!(name:  "Nolan")
# User.create!(name:  "Vikie")

# 15.times do |n|
#   name  = "Project-#{n+1}"
#   user_id = 1
#   Project.create!(name:  name,
#               user_id: user_id)
# end
# project_id = 1
# 15.times do |nn|
#   15.times do |n|
#     name  = "List-#{n+1}"
#     List.create!(name:  name,
#     project_id: project_id)
#   end
#   project_id += 1
# end

project_id = 1
list_id = 1
15.times do |nnn|
  15.times do |nn|
    15.times do |n|
      Item.create!(content:  "Lorem ipsum dolor sit amet",
      project_id: project_id,
      parent_id: list_id,
      list_id: list_id,
      assignees: "1",
      is_completed: false)
    end
    list_id += 1
  end
  project_id += 1
end