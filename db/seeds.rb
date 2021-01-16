# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or first_or_created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Test.all.empty?
  Category.first_or_create([
    {title: 'c1'},
    {title: 'c2'}
  ])

  User.first_or_create([
    {name: 'U1'},
    {name: 'U2'}
  ])

  Test.first_or_create([
    {title: 't1', category_id: 1, author_id: 1},
    {title: 't2', category_id: 2, author_id: 2}
  ]) 

  Question.first_or_create([
    {title: 'q1', test_id: 1},
    {title: 'q2', test_id: 1},
    {title: 'q3', test_id: 1},
    {title: 'q4', test_id: 2},
    {title: 'q5', test_id: 2},
    {title: 'q6', test_id: 2},

  ])

  Answer.first_or_create([
    {title: 'a1', question_id: 1, correct: true},
    {title: 'a2', question_id: 1},
    {title: 'a3', question_id: 2},
    {title: 'a4', question_id: 2, correct: true},
    {title: 'a5', question_id: 3},
    {title: 'a6', question_id: 3},
    {title: 'a7', question_id: 3, correct: true},
    {title: 'a8', question_id: 4, correct: true},
    {title: 'a9', question_id: 4},
    {title: 'a10', question_id: 4},
    {title: 'a11', question_id: 5},
    {title: 'a12', question_id: 5, correct: true},
    {title: 'a13', question_id: 6},
    {title: 'a14', question_id: 6, correct: true},

  ])

  UserTest.first_or_create([
    {user_id: 1, test_id: 1},
    {user_id: 1, test_id: 2}
  ])
end
