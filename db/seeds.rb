# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Recipe.create(title: "Banana Bread", ingredients: "Bananas,Flour, Egg, Sugar, Salt, Baking Soda", prep_time: "10 mins", cook_time: "60 mins", total_time: "70 mins", instructions: "mix everything together and put it in the oven at 350°F", user_id: 1)

Recipe.create(title: "Tates Chocolate Chip Cookies", ingredients: "Butter, Sugar, Brown Sugar, Eggs, Vanilla Extract, Salt, Baking Soda, Flour, Chocolate Chips", prep_time: "10 mins", cook_time: "12 mins", total_time: "26 mins", instructions: "mix it all together and put it in the oven at 350°F", user_id: 1)

Cuisine.create(title: "American")

Cuisine.create(title: "Korean")
